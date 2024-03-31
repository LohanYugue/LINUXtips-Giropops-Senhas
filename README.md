Realizar o build do Redis

```docker image build -t <nome-da-imagem-redis> -f Dockerfile-redis .```


Realizar o build do App

```docker image build -t <nome-da-imagem-flask> Dockerfile .```


Subir os containers

```docker container run -d --name redis -p 6379:6379 <nome-da-imagem-flask>```

```docker container run -d --name flask -p 5000:5000 -e REDIS_HOST=<IP-DO-CONTAINER-REDIS> <nome-da-imagem-flask>```


Testar pelo navegador, acessando:

```http://127.0.0.1:5000/```
