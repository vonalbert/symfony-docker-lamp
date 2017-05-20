DOCK=docker-compose
RUN=$(DOCK) run --rm app
EXEC=$(DOCK) exec app
SF=$(RUN) bin/console
DB_PORT=3306


# ----------------------------
# Environment controls
start: build up init perm
stop: kill remove
restart: stop start

init: vendor db-wait db


# ----------------------------
# Vendors management commands
vendor:
	-$(RUN) composer install
	make perm

vendor-update:
	-$(RUN) composer update
	make perm

vendor-clear:
	-rm -rf vendor

# ----------------------------
# Symfony commands
db:
	$(SF) doctrine:database:create --if-not-exists
	$(SF) doctrine:schema:update --force

db-wait:	# Wait for database connection
	$(RUN) php -r "for(;;){if(@fsockopen('db',$(DB_PORT))){break;}}"

db-remove:
	$(SF) doctrine:database:drop --force --if-exists

db-reset: db-remove db

cc:
	$(SF) cache:clear

clear: perm
	-rm -rf var/cache/*
	-rm -rf var/logs/*
	-rm -rf var/sessions/*


# ----------------------------
# Internals
build:
	$(DOCK) build

up:
	$(DOCK) up -d

kill:
	$(DOCK) kill

remove:
	$(DOCK) rm -vf

perm:
	-$(EXEC) chmod 777 app/config/parameters.yml
	$(EXEC) chmod 777 -R var
	$(EXEC) chmod 777 -R vendor
