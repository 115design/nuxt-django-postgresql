ID = xxx
CMD = xxx

start:
	docker-compose up -d

start_log:
	docker-compose up

stop:
	docker-compose stop

restart:
	docker-compose restart

restart_django:
	docker-compose restart django

restart_nuxt:
	docker-compose restart nuxt

build_all:
	docker-compose build

build:
	docker-compose build ${ID}

con:
	docker ps -a

con_prune:
	docker ps -aq | xargs docker rm

img:
	docker images

img_prune:
	docker images -aq | xargs docker rmi

vol:
	docker volume ls

rm:
	docker rm ${ID}

rmi:
	docker rmi ${ID}

rmv:
	docker volume rm ${ID}

cmd_django:
	docker-compose exec django bash

cmd_nuxt:
	docker-compose exec nuxt bash

cmd_db:
	docker-compose exec postgresql bash

delete_migrations:
	find . -path "./backend/**/migrations/*.py" -not -name "__init__.py" | xargs rm -rf
	find . -path "./backend/**/migrations/__pycache__" | xargs rm -rf

backup_db:
	docker-compose exec -T postgresql pg_dump -U mysiteuser -w mysite > ./db/backup/postgresql/postgresql-`date +"%Y%m%d"`.sql

restore_db:
	docker-compose exec -T postgresql psql -d mysite -U mysiteuser -w < ./db/backup/postgresql/${ID}.sql

log_all:
	docker-compose logs -tf

log_django:
	docker-compose logs -tf django

log_nuxt:
	docker-compose logs -tf nuxt

log_postgresql:
	docker-compose logs -tf postgresql

log_nginx:
	docker-compose logs -tf nginx

log_celery:
	docker-compose logs -tf celery

shell_django:
	docker-compose exec django python manage.py shell

check_django:
	docker-compose exec django python manage.py check

collect_static:
	docker-compose exec django python manage.py collectstatic

# Manage the Django database
make_migrations:
	docker-compose exec django python manage.py makemigrations

migrate:
	docker-compose exec django python manage.py migrate

create_superuser:
	docker-compose exec django python manage.py createsuperuser

test:
	docker-compose exec django python -Wall manage.py test ${ID}

test_all:
	docker-compose exec django python -Wall manage.py test
