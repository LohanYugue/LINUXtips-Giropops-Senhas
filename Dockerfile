FROM ubuntu:20.04

WORKDIR /app

COPY giropops-senhas ./

RUN apt-get update && apt-get install pip redis -y

RUN pip install --no-cache-dir -r requirements.txt

RUN service redis-server start

ENV REDIS_HOST=localhost

ENTRYPOINT ["flask"]

CMD ["run", "--host=0.0.0.0"]
