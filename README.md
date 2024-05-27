# How to use zap docker image

- Use **docker run**

```bash
    docker run --restart unless-stopped -d -p 0.0.0.0:8083:8083 hoainamnv34/zap:0.0.4
``` 

- User **docker-compose**

```docker-compose
version: "3"
services:
  zap:
    image: hoainamnv34/zap:0.0.4
    container_name: zap
    restart: unless-stopped
    ports:
      - "8083:8083"

```