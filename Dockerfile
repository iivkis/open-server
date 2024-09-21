# Базовый образ Python
FROM python:3.11-slim

RUN pip install poetry

# Устанавливаем рабочую директорию в контейнере
WORKDIR /app

# Копируем файл зависимостей pyproject.toml и lock-файл в контейнер
COPY pyproject.toml poetry.lock* /app/

# Устанавливаем зависимости с помощью Poetry
RUN poetry install --no-root --no-dev

# Копируем остальной код в контейнер
COPY . /app/

# Устанавливаем утилиты make
RUN apt-get update && apt-get install -y make && rm -rf /var/lib/apt/lists/*

# Команда по умолчанию - запуск `make run`
CMD ["make", "run"]
