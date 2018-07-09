alias dk="docker "
alias dklog="docker logs -f --tail 100 "
alias dkl="docker logs -f --tail 100 "
alias dkdf="dk system df"
# Stop and remove a single container
alias dkrm='docker rm -f '
# Stop and remove all running containers
alias dkrm!='docker rm -f $(docker ps -a -q)'

alias dc="docker-compose"
alias dcup="docker-compose up -d "
alias dcrun="docker-compose run --rm "
function dcdebug {
  docker-compose kill $1
  docker-compose run --service-ports $1
}
# Stop and recreate a container
alias dcreup="docker-compose up -d --force-recreate --no-deps "
alias dcre="docker-compose up -d --force-recreate --no-deps "
alias dclog="docker-compose logs -f --tail 100 "
alias dcl="docker-compose logs -f --tail 100 "

alias ds="docker-sync"
alias dss="docker-sync start"
alias dsx="docker-sync stop"

alias dcbomb!="docker-compose down -v"

# Open bash in a container. Pass docker-compose name
function dcbash {
  docker-compose exec $1 /bin/bash
}

# Open bash in a container. Pass container name
function dkbash {
  docker exec -it $1 /bin/bash
}
