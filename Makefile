run:
	PYTHONDONTWRITEBYTECODE=1 \
	poetry run uvicorn \
	--host 0.0.0.0 \
	--port 80 \
	open_server:app