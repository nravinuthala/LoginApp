# syntax=docker/dockerfile:1
FROM nginx:latest
FROM python:3.8-slim-buster

WORKDIR /login-app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

CMD [ "python3", "-m", "flask", "run", "--host=0.0.0.0" ]

EXPOSE 80
COPY ./index.html /usr/share/nginx/html/index.html
ENTRYPOINT ["nginx"]