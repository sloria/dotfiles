alias dk="docker "
alias dc="docker-compose"
alias dcup="docker-compose up -d "
alias dcrun="docker-compose run --rm "
# Stop and recreate a container
alias dcreup="docker-compose up -d --force-recreate --no-deps "
alias dclog="docker-compose logs -f --tail 100 "
alias dcl="docker-compose logs -f --tail 100 "
alias dss="docker-sync start"
alias dcbomb!="docker-compose down -v"

function dcbash {
  docker-compose exec $1 /bin/bash
}
