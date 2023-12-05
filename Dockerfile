# FROM python:3.11.6-alpine
FROM mcr.microsoft.com/azure-functions/python:4-python3.11

WORKDIR /code

COPY ./requirements.txt ./

RUN apt-get update

RUN apt-get install -y gcc libc-dev g++ libffi-dev libxml2 unixodbc-dev

RUN pip install --no-cache-dir -r requirements.txt

COPY ./src ./src

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "5000", "--reload"]
