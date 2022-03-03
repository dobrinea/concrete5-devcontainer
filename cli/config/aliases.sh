alias install="(
docker-compose -f .devcontainer/docker-compose.yml -p codespaces-compose run --rm composer --ignore-platform-reqs create-project -n concrete5/composer application
cd application
./vendor/bin/concrete5 c5:install --db-server=${DB_SERVER} --db-username=${DB_USERNAME} --db-password=${DB_PASSWORD} --db-database=${DB_DATABASE} --site=${PROJECT_NAME} --starting-point=${STARTING_POINT} --admin-email=${ADMIN_EMAIL} --admin-password=${ADMIN_PASSWORD}
./vendor/bin/concrete5 c5:config set -g concrete.seo.url_rewriting true
./vendor/bin/concrete5 c5:clear-cache 
)"

#alias mongo='docker-compose -f /home/vscode/workspace/vscode-devcontainer-php/.devcontainer/docker-compose.yml -p codespaces-compose run --rm --workdir="$(pwd)" mongo mongo'
