### ConcreteCMS Development Containers for Visual Studio Code

`concrete5-devcontainer` is a simple configuration to support fully-dockerised development of ConcreteCMS applications using Visual Studio Code. The only requirements are:

- [Visual Studio Code](https://code.visualstudio.com/)
- [Visual Studio Code Remote Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

Visual Studio Code will actually run inside a Docker container with php-cli as well as other development tools.
Any Extensions will also run in the same container, meaning that intellisense will use the same php-cli configuration!

`concrete5-devcontainer` currently ships with:
- `php:${PHP_VERSION}-cli-bullseye` workspace with composer, pgsql, redis, and nodejs.
- `php:${PHP_VERSION}-fpm-bullseye` container with pgsql and redis extensions.
- `nginx:1.21` preconfigured for your Laravel application.
- `mysql/mysql-server:8.0` preconfigured with the default Laravel credentials.
- `composer/composer` for caching, queues, sessions, etc.

#### Easy Installation

Using this configuration is quite simple. [Download](https://github.com/dobrinea/concrete5-devcontainer/archive/refs/heads/main.zip) and place content of `concrete5-devcontainer` to a `.devcontainer` folder in a root of project. The folder where you place src of concreteCMS should be named `application`.  If starting a new project, you need create a new folder with name `.devcontainer` in your project folder by [clone](https://github.com/dobrinea/concrete5-devcontainer.git) or [Download](https://github.com/dobrinea/concrete5-devcontainer/archive/refs/heads/main.zip). You may then install concreteCMS by typing in the bash console of opened devcontainer - `install`.

#### Installing Using Git Submodules
Alternatively, you may use [Git Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules). Install the configuration by running

```sh
git submodule add https://github.com/dobrinea/concrete5-devcontainer.git .devcontainer
```

If you use this method, do not forget to install submodules when cloning:

```
git clone --recurse-submodules ...
```

#### Usage
Start Visual Studio Code (e.g. `code example-app`) and re-open in remote containers (`Remote-Containers: Reopen in Container`). This may take some time on the first use, as Docker initially downloads and builds the images. Eventually, Visual Studio Code will run inside the workspace container. Extensions and settings specified in `devcontainer.json` will be auto-configured!

Be sure to correctly configure your application `.env` to use the devcontainer. For example:

```env
PROJECT_NAME=[Project's name]

LOCAL_WORKSPACE_FOLDER=[path to project folder]

PHP_VERSION=8.0

REMOTE_USER=[user which run vsc, cli, fpm containers. same user in the devcontainer.json]
USER_UID=1000
USER_GID=1000

TIME_ZONE=Asia/Tokyo
LOCALE=ja_JP.UTF-8

DB_SERVER=mysql
DB_DATABASE=docker
DB_USERNAME=docker
DB_PASSWORD=docker

# Local Loopback Address(127.0.0.0/8):
IP_ADDRESS_SETTING=127.127.127.127:

#starting-point can be atomik_full|elemental_blank|elemental_full
STARTING_POINT=elemental_full

ADMIN_EMAIL=[email of concrete admin]
ADMIN_PASSWORD=[password of concrete admin]
```

##### IP_ADDRESS_SETTING
Docker allows you to set the IP address to be published for each port, but it is recommended to set the IP address so that you don't have to worry about duplicate ports for multiple projects.

It is convenient to configure the `hosts` with the configured IP address.
```
127.127.127.127 php-develop.test

You may then navigate to [`php-develop.test`](http://php-develop.test) on your local machine. Fingers crossed, you will see your ConcreteCMS application!
As such, you do not need anything else installed on your host machine!

#### Extensions

`concrete5-devcontainer` currently ships with the following extensions for ConcreteCMS development in Visual Studio Code:
- ["bmewburn.vscode-intelephense-client"](https://marketplace.visualstudio.com/items?itemName=bmewburn.vscode-intelephense-client)
- ["eamodio.gitlens"](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
- ["EditorConfig.EditorConfig"](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
- ["mikestead.dotenv"](https://marketplace.visualstudio.com/items?itemName=mikestead.dotenv)
- ["vivaxy.vscode-conventional-commits"](https://marketplace.visualstudio.com/items?itemName=vivaxy.vscode-conventional-commits)
- ["ms-azuretools.vscode-docker"](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
- ["xdebug.php-debug"](https://marketplace.visualstudio.com/items?itemName=xdebug.php-debug)
- ["mhutchie.git-graph"](https://marketplace.visualstudio.com/items?itemName=mhutchie.git-graph)
- ["emilast.LogFileHighlighter"](https://marketplace.visualstudio.com/items?itemName=emilast.LogFileHighlighter)
- ["neilbrayfield.php-docblocker"](https://marketplace.visualstudio.com/items?itemName=neilbrayfield.php-docblocker)
- ["mtxr.sqltools"](https://marketplace.visualstudio.com/items?itemName=mtxr.sqltools)
- ["mtxr.sqltools-driver-mysql"](https://marketplace.visualstudio.com/items?itemName=mtxr.sqltools-driver-mysql)
