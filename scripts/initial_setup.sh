#!/bin/bash


git clone https://github.com/todarch/todarch-docs.git
cat "source $HOME/todarch-docs/scripts/todarch-env.sh" >> $HOME/.bashrc
source $HOME/.bashrc

ln -s $TODARCH_DOCS/scripts/deploy_app.sh $HOME/deploy_app

docker network create proxy
chmod 600 $TODARCH_DOCS/docker-compose/acme.json
# TODO: get rid off the following condition
# we need to be in this directory, cus of acme file reference in docker-compose
cd $TODARCH_DOCS/docker-compose
# be sure there are a A record for catch all like *.todarch.com
dcp up -d rp
