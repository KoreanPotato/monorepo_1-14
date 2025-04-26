FROM python:3.12-slim

WORKDIR /app

COPY ../web-ui/src/ /app/

RUN pip install --no-cache-dir flask

EXPOSE 8080

CMD ["python", "/app/app.py"]
