alias dlogs="docker logs -f --tail 100 "
# Stop and remove all running containers
alias drm!='docker rm -f $(docker ps -a -q)'

alias dc="docker compose"
alias dcup="docker compose up -d "
alias dcrun="docker compose run --rm "
# Stop and recreate a container
alias dcre="docker compose up -d --force-recreate --no-deps "
alias dclogs="docker compose logs -f --tail 100 "
alias dcl="docker compose logs -f --tail 100 "

# Open bash in a container. Pass compose name
function dcbash {
  docker compose exec $1 /bin/bash
}

# Open sh in a container. Pass compose name
function dcsh {
  docker compose exec $1 /bin/sh
}

# Open bash in a container. Pass container name
function dbash {
  docker exec -it $1 /bin/bash
}

# Open sh in a container. Pass container name
function dsh {
  docker exec -it $1 /bin/sh
}
