# Alphasocket/dockerized-magento-vanilla
#### magento-vanilla
Magento vanilla container


| [![Build Status](https://semaphoreci.com/api/v1/alphasocket/dockerized-magento-vanilla/branches/latest/badge.svg)](https://semaphoreci.com/alphasocket/dockerized-magento-vanilla) | Layers | Size  |
| ----- | ----- | ----- |
| Dev image | [![](https://images.microbadger.com/badges/image/03192859189254/dockerized-magento-vanilla:latest.svg)](https://microbadger.com/images/03192859189254/magento-vanilla:latest ) | [![](https://images.microbadger.com/badges/version/03192859189254/dockerized-magento-vanilla:latest.svg)](https://microbadger.com/images/03192859189254/magento-vanilla:latest) |
| Prd image | [![](https://images.microbadger.com/badges/image/alphasocket/magento-vanilla:latest.svg)](https://microbadger.com/images/alphasocket/magento-vanilla:latest ) | [![](https://images.microbadger.com/badges/version/alphasocket/magento-vanilla:latest.svg)](https://microbadger.com/images/alphasocket/magento-vanilla:latest) |

## Branches & Versions
- latest
- latest-cached


## Packages installed
- Config dependencies:
  + rsync
  + gettext


## Configurable envvars
~~~
CONFIG_REDINESS_TEST="true"
CONFIG_LIVENESS_TEST="true"
CONFIG_PROJECT_CODENAME="vanilla"
CONFIG_PROJECT_DESCRIPTION="Magento Vanilla"
CONFIG_USER="magento-vanilla"
CONFIG_GROUP="magento"
CONFIG_PATHS_CONTAINER_STATUS="/tmp/container_status"
CONFIG_PATHS_TEMPLATES_REDIS="/usr/local/templates/redis.xml"
CONFIG_PATHS_CONFIG_REDIS="$CONFIG_PATHS_WEBROOT/app/etc/redis.xml"
CONFIG_SAMPLE_DATA_INSTALL="True"
CONFIG_SAMPLE_DATA_VERSION="1.9.2.4"
CONFIG_SAMPLE_DATA_PATH="'/tmp/magento-sample-data-${CONFIG_SAMPLE_DATA_VERSION}.zip'"
CONFIG_SAMPLE_DATA_URL="'https://netcologne.dl.sourceforge.net/project/mageloads/assets/${CONFIG_SAMPLE_DATA_VERSION}/magento-sample-data-${CONFIG_SAMPLE_DATA_VERSION}.zip'"
CONFIG_SAMPLE_DATA_CHECKSUM="ddb2103137e257006e30b66122caa999"
CONFIG_ADMIN_USERNAME="admin"
CONFIG_ADMIN_LASTNAME="Admin"
CONFIG_ADMIN_FIRSTNAME="Admin"
CONFIG_ADMIN_EMAIL="jhon@doe.ie"
CONFIG_ADMIN_PASS="password.123"
CONFIG_MAGENTO_VERSION="1.9.3.6"
CONFIG_MAGENTO_USER="magento-vanilla"
CONFIG_MAGENTO_GROUP="magento"
CONFIG_MAGENTO_URL="http://www.magento.vanilla/"
CONFIG_MAGENTO_INSTALL_SCRIPT_URL="https://raw.githubusercontent.com/AlphaSocket/mage-install/master/install"
CONFIG_MAGENTO_INSTALL_SCRIPT_PATH="$CONFIG_PATHS_BINARIES/mage-install"
CONFIG_MAGENTO_INSTALL_FOLDER="$CONFIG_PATHS_WEBROOT"
CONFIG_MAGENTO_INSTALL_ENV_PATH="/usr/local/mage_install_env"
CONFIG_MAGENTO_USE_REWRITES="yes"
CONFIG_MAGENTO_USE_SECURE="no"
CONFIG_MAGENTO_USE_BASE_URL=""
CONFIG_MAGENTO_USE_SECURE_ADMIN="no"
CONFIG_MAGENTO_SKIP_URL_VALIDATION="yes"
CONFIG_MAGENTO_LOCALE="en_IE"
CONFIG_MAGENTO_TIMEZONE="Europe/Dublin"
CONFIG_MAGENTO_DEFAULT_CURRENCY="EUR"
CONFIG_MAGENTO_SESSION_SAVE="db"
CONFIG_MAGENTO_ADMIN_FRONTNAME="admin"
CONFIG_MAGENTO_DISABLE_CACHE="no"
CONFIG_MAGENTO_SET_PRIVILEGES_OWNERSHIP="no"
CONFIG_MAGENTO_DEVELOPER_MODE="yes"
CONFIG_DB_HOST="127.0.0.1"
CONFIG_DB_NAME="database"
CONFIG_DB_USER="root"
CONFIG_DB_PASS="root"
CONFIG_DB_PREFIX=""
CONFIG_REDIS_ENABLED="True"
CONFIG_REDIS_HOST="127.0.0.1"
CONFIG_REDIS_PORT="6379"
CONFIG_TURPENTINE_ENABLED="True"
CONFIG_TURPENTINE_BACKEND_HOST="127.0.0.1"
CONFIG_TURPENTINE_BACKEND_PORT="8080"
CONFIG_TURPENTINE_BACKEND_CONTROL_PANEL_HOST="127.0.0.1"
CONFIG_TURPENTINE_BACKEND_CONTROL_PANEL_PORT="6082"
CONFIG_TURPENTINE_AUTH_KEY=""
CONFIG_COMPOSER_INIT="yes"
~~~
