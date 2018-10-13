# Up and Running with Docker Compose

- be sure to have docker and docker-compose installed

```shell
docker-compose version
docker version
```

- Todarch Docker Images are pushed to [Docker public repository](https://hub.docker.com/u/todarch/).

- Some [docker-compose commands](https://github.com/SSSelim/learning/blob/master/docker/compose/commands.md) for starting.

- Applications seems to be dependent on each other, but they do not wait for
  application to be fully ready. However, they keep trying to start, at some
  point the dependent application will be ready.
