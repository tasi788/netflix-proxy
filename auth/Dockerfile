FROM python:3.7-buster as builder
WORKDIR /app
COPY requirements.txt .
RUN apt update && \
    apt install cron sqlite3 -y
RUN pip install -r requirements.txt

FROM builder
ENV PYTHONUNBUFFERED=0
WORKDIR /app
CMD ["sh", "run.sh"]