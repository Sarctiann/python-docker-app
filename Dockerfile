FROM python:3.11.6-alpine

WORKDIR /code

COPY ./requirements.txt ./

RUN apk update

RUN apk add \
  gcc libc-dev g++ libffi-dev libxml2 unixodbc-dev mariadb-dev postgresql-dev

RUN pip install --no-cache-dir -r requirements.txt

COPY ./src ./src

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "5000", "--reload"]
