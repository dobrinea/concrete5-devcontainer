alias install_full="(
    docker-compose -f .devcontainer/docker-compose.yml -p codespaces-compose run --rm composer --ignore-platform-reqs create-project -n concrete5/composer application
    cd application
    ./vendor/bin/concrete5 c5:install --db-server=${DB_SERVER} --db-username=${DB_USERNAME} --db-password=${DB_PASSWORD} --db-database=${DB_DATABASE} --site=${PROJECT_NAME} --starting-point=${STARTING_POINT} --admin-email=${ADMIN_EMAIL} --admin-password=${ADMIN_PASSWORD}
    ./vendor/bin/concrete5 c5:config set -g concrete.seo.url_rewriting true
    ./vendor/bin/concrete5 c5:clear-cache 
)"

alias install_exiting="(
    docker-compose -f .devcontainer/docker-compose.yml -p codespaces-compose run --rm composer --working-dir=application --ignore-platform-reqs install
    mysqldump -h ${DB_SERVER} -u ${DB_USERNAME} -p${DB_PASSWORD} ${DB_DATABASE} < database.sql
)"

alias backup_database="mysqldump -y -h ${DB_SERVER} -u ${DB_USERNAME} -p${DB_PASSWORD} ${DB_DATABASE} > database.sql"

#mysqldump -y -h mysql -u docker -pdocker docker > docker.sql

#docker-compose -f .devcontainer/docker-compose.yml -p codespaces-compose run --rm composer --working-dir=application --ignore-platform-reqs install

#alias mongo='docker-compose -f /home/vscode/workspace/vscode-devcontainer-php/.devcontainer/docker-compose.yml -p codespaces-compose run --rm --workdir="$(pwd)" mongo mongo'
