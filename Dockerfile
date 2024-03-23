FROM python:3.11-alpine

MAINTAINER "Lohan Petermann <lohanpetermann@hotmail.com>"

WORKDIR /app

COPY app.py .
COPY requirements.txt .
COPY static static/
COPY templates templates/

RUN pip install --no-cache-dir -r requirements.txt

ENV REDIS_HOST=172.17.0.2

EXPOSE 5000

ENTRYPOINT ["flask"]

CMD ["run", "--host=0.0.0.0"]
