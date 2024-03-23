FROM ubuntu:20.04

MAINTAINER "Lohan Petermann <lohanpetermann@hotmail.com>"

WORKDIR /app

COPY giropops-senhas ./

RUN apt-get update && apt-get install pip curl -y

RUN pip install --no-cache-dir -r requirements.txt

RUN apt-get install telnet vim -y

ENV REDIS_HOST=172.17.0.2

EXPOSE 5000

ENTRYPOINT ["flask"]

CMD ["run", "--host=0.0.0.0"]
