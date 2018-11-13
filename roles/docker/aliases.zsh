alias d="docker "
alias dlog="docker logs -f --tail 100 "
alias dl="docker logs -f --tail 100 "
alias ddf="docker system df"
# Stop and remove a single container
alias drm='docker rm -f '
# Stop and remove all running containers
alias drm!='docker rm -f $(docker ps -a -q)'

alias dc="docker-compose"
alias dcup="docker-compose up -d "
alias dcrun="docker-compose run --rm "
function dcdebug {
  docker-compose kill $1
  docker-compose run --service-ports $1
}
# Stop and recreate a container
alias dcre="docker-compose up -d --force-recreate --no-deps "
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
function dbash {
  docker exec -it $1 /bin/bash
}
