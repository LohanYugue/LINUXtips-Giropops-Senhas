FROM cgr.dev/chainguard/python:latest-dev as builder

MAINTAINER "Lohan Petermann <lohanpetermann@hotmail.com>"

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt --user

FROM cgr.dev/chainguard/python:latest

WORKDIR /app

COPY --from=builder /home/nonroot/.local/lib/python3.12/site-packages /home/nonroot/.local/lib/python3.12/site-packages
COPY --from=builder /home/nonroot/.local/bin /home/nonroot/.local/bin
COPY --from=builder /app/* .
COPY app.py .
COPY static static/
COPY templates templates/

EXPOSE 5000

ENV PATH=/home/nonroot/.local/bin

ENTRYPOINT ["flask", "run", "--host=0.0.0.0"]

