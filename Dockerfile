# FROM python:3.11.6-alpine
FROM mcr.microsoft.com/azure-functions/python:4-python3.11

WORKDIR /home/site/wwwroot

ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
  AzureFunctionsJobHost__Logging__Console__IsEnabled=true

COPY ./ ./

RUN apt-get update

RUN apt-get install -y \
  gcc libc-dev g++ libffi-dev libxml2 unixodbc-dev azure-functions-core-tools-4

RUN pip install --no-cache-dir -r requirements.txt

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "5000", "--reload"]
