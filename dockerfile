FROM python:3.8-alpine

WORKDIR /app

COPY requirements.txt .

RUN apk add --no-cache --virtual .build-deps gcc musl-dev && \
    pip install --no-cache-dir -r requirements.txt && \
    apk del .build-deps gcc musl-dev

COPY . .

CMD ["python", "app.py"]
