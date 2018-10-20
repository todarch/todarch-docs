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

## Use Todarch App

### Web UI

```shell
cd <some-on-your-machine>/todarch-docs/docker-compose
docker-compose up -d ui
```

- Wait a few minutes and visit localhost:7005

### Cli

```shell
cd <some-on-your-machine>/todarch-docs/docker-compose
docker-compose up -d gw
```

- Wait a few minutes and run the following:

```shell
todarch check
```

## Development

Todarch application is formed of a few pieces, just follow to see which services
you should start before start to hack.

#### Working on ui

- ui service depends on gw, which depends on td and um, they finaly depend on db
  and cs services.

```shell
docker-compose up -d gw
```

```shell
# in .env.development file
REACT_APP_API_ENDPOINT=http://localhost:7004
```

- Now you can work on your local copy of React application.

#### Working on cli

- cli application also needs gateway endpoint

```shell
docker-compose up -d gw
```

```shell
# in ~/.todarch/config.yml
todarchApiBase: http://localhost:7004
```

- Now you can change source code, build and run cli commands.

#### Working on um or td

- um and td services only need db and cs services.

```shell
# because there is not dependency between cs and db
# we should start them separately
docker-compose up -d cs db
```

- Now we can just open um or td application in favorite IDE.

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

- Configuration in production may be more complicated than local environment

```shell
chmod 600 acme.json
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d ui rp

docker-compose -f docker-compose.yml -f docker-compose.prod.yml ps
```

## Helpers

- It will not be fun to type all those long commands every time

```shell
# add to your ~/.bashrc or ~/.bash_profile
export TODARCH_DOCS='/home/selimssevgi/todarch-docs' # replace the path for your system

# add it to ~/.bash_aliases for production
alias dcp='docker-compose -f $TODARCH_DOCS/docker-compose/docker-compose.yml -f $TODARCH_DOCS/docker-compose/docker-compose.prod.yml'

# for development
alias dcd='docker-compose -f $TODARCH_DOCS/docker-compose/docker-compose.yml'

# check your environment in production
dcp ps
dcp logs rp
```
