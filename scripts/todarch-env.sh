# add to your ~/.bashrc or ~/.bash_profile
export TODARCH_DOCS='$HOME/todarch-docs'

# add it to ~/.bash_aliases for production
alias dcp='docker-compose -f $TODARCH_DOCS/docker-compose/docker-compose.yml -f $TODARCH_DOCS/docker-compose/docker-compose.prod.yml'