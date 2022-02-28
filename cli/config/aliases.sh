#alias composer='docker-compose -f /.devcontainer/docker-compose.yaml -p codespaces-compose run --rm --workdir="$(pwd)" composer'
alias composer='docker-compose -f .devcontainer/docker-compose.yml -p codespaces-compose run --rm --workdir="${pwd}" composer'
alias install='docker-compose -f .devcontainer/docker-compose.yml -p codespaces-compose run --rm --workdir="${pwd}" composer --ignore-platform-reqs create-project -n concrete5/composer application'
# alias install="(
# docker-compose -f .devcontainer/docker-compose.yml -p codespaces-compose run --rm composer --ignore-platform-reqs create-project -n concrete5/composer application
# cd application
# ./vendor/bin/concrete5 c5:install --db-server=mysql --db-username=docker --db-password=docker --db-database=docker --site='FinanceGroup' --starting-point='elemental_full' --admin-email=webhex@yandex.ru --admin-password=smart1nokia 
# )"
#alias composer='docker-compose -f /workspaces/concrete5/.devcontainer/docker-compose.yaml -p codespaces-compose run --rm --workdir="$(pwd)" composer --ignore-platform-reqs'

#alias mongo='docker-compose -f /home/vscode/workspace/vscode-devcontainer-php/.devcontainer/docker-compose.yml -p codespaces-compose run --rm --workdir="$(pwd)" mongo mongo'
