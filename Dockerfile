FROM ubuntu:20.04

RUN apt update \
    && apt -y install software-properties-common

RUN apt -y install python3-pip

RUN mkdir app && cd app
RUN apt-get install libpq-dev -y

COPY bacardi_dc .
COPY requirements.txt .

RUN pip3 install -r requirements.txt


RUN cd bacardi_dc

CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000"]
