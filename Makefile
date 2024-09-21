run:
	PYTHONDONTWRITEBYTECODE=1 \
	poetry run app

run-docker:
	docker build -t open_server .
	docker run -it -p 0.0.0.0:80:80 --rm open_server

