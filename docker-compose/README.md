# Up and Running with Todarch

This document explains how to run Todarch application in your local, which can
be used for using the application, as well as for development.

- be sure to have docker and docker-compose installed

```shell
docker-compose version
docker version
```

- Todarch Docker Images are pushed to [Docker Hub](https://hub.docker.com/u/todarch/).

* 'latest' is default tag if none is given, when you have a docker image in your
  local, it will NOT try to bring updated version of same tag. Therefore, you may
  keep an eye on the Docker Hub for new tags after if you
  would like to run new version of the services.

- Applications seems to be dependent on each other, but they do not wait for
  application to be fully ready. However, they keep trying to start, at some
  point the dependent application will be ready.

## Debugging

The life will be easier if we know some of the debugging tools:

```shell
docker-compose ps # shows state of services
docker-compose logs td # shows logs from td service

psql --host=localhost --dbname=todarchtd --username=todarchuser
```

- Reach inside the database, if you would like to see what is going on there.

```shell
psql --host=localhost --dbname=todarchtd --username=todarchuser
```

## Production

### reverse-proxy

```shell
chmod 600 acme.json
dcp up -d rp
```

- visit rp.todarch.com

```shell
dcp logs rp # if not attaching
dcp stop rp
dcp up rp # run in attached mode
```

### keycloak

- be sure user/pass env variables are set (ansible config)

```shell
dcp up -d keykloak
```

- visit id.todarch.com

## Helpers

- It will not be fun to type all those long commands every time

```shell
source $HOME/todarch-docs/scripts/todarch-env.sh
```

```shell
# for development
alias dcd='docker-compose -f $TODARCH_DOCS/docker-compose/docker-compose.yml'

# check your environment in production
dcp ps
dcp logs rp
```
