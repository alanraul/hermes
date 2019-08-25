##################################################################
#### Bootstrap Commands
##################################################################

bootstrap:
	docker-compose run --rm -T --no-deps phx sh -c "mix deps.get && mix deps.compile"

reset:
	docker-compose run --rm --no-deps phx sh -c "rm -rf /app/src/deps/* /app/src/_build/dev/*"
	docker-compose stop
	docker-compose rm -f

##################################################################
#### Docker Commands
##################################################################

start:
	docker-compose up -d phx

restart:
	docker-compose restart phx

restart.postgres:
	docker-compose restart postgres

stop:
	docker-compose stop phx

stop.postgres:
	docker-compose stop postgres

logs:
	docker-compose logs -f phx

logs.postgres:
	docker-compose logs -f postgres

shell:
	docker-compose run --rm phx sh

shell.postgres:
	docker-compose run --rm postgres sh -c "psql -U postgres -h postgres ${db}"

shell.test:
	ENV=test docker-compose run --rm phx sh

##################################################################
#### Development Commands
##################################################################

deps.update:
	docker-compose run --rm phx sh -c "mix deps.clean --unused && mix deps.get && mix deps.compile"

routes:
	docker-compose run --rm  phx sh -c "mix phx.routes"

test:
	ENV=test docker-compose run --rm  phx sh -c "mix test"
