build:
	docker build -t local:self-hosted-prerender .

down:
	docker-compose down -v

up: down
	docker-compose up

ping-raw:
	curl -H "Host: prerender.lvh.voronenko.net:80"  http://localhost:5080

ping-bot:
	curl -A googlebot -H "Host: prerender.lvh.voronenko.net:80"  http://localhost:5080
