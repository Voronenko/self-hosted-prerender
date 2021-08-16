build:
	docker build -t local:self-hosted-prerender .

down:
	docker-compose down -v

up: down
	docker-compose up
