FROM python:3.7-buster as builder
WORKDIR /app
COPY requirements.txt .
RUN apt update && \
    apt install cron sqlite3 -y
RUN pip install -r requirements.txt

FROM builder
WORKDIR /app
CMD ["python", "auth.py"]