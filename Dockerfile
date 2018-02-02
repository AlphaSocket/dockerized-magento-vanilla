#
# Do not change content here, image automatically built
#
FROM docker.io/alphasocket/magento-cli-alpine:latest

ARG BUILD_COMMIT
ARG BUILD_DATE

ENV \
	GENERAL_DOCKER_USER="03192859189254" \
	GENERAL_DOCKER_REGISTRY="docker.io" \
	GENERAL_KEYS_TRUE="True" \
	GENERAL_KEYS_FALSE="False" \
	GENERAL_KEYS_DEV="dev" \
	GENERAL_KEYS_PRD="prd" \
	BUILD_NAME="magento-vanilla" \
	BUILD_BRANCH="latest" \
	BUILD_VERSION="latest" \
	BUILD_ENV="prd" \
	BUILD_DOCKERFILE_IMAGE="docker.io/alphasocket/magento-cli-alpine:latest" \
	BUILD_DOCKERFILE_WORKDIR="/var/www/html" \
	BUILD_DOCKERFILE_CMD="/usr/sbin/crond -f -l $CONFIG_CRON_LOG_LEVEL" \
	SETUP_DEPENDENCIES_SETUP="" \
	SETUP_DEPENDENCIES_CONFIG="" \
	SETUP_CACHE_MAGENTO_INSTALLER_VERSION="1.9.3.6" \
	SETUP_CACHE_MAGENTO_INSTALLER_URL="https://github.com/OpenMage/magento-mirror/archive/1.9.3.6.zip" \
	SETUP_CACHE_MAGENTO_INSTALLER_PATH="~/.composer/cache/files/magento-mirror-1.9.3.6/c9778473d2ea69f4f1dd464ad616c5a9d6307a96.zip" \
	SETUP_CACHE_MAGENTO_SAMPLE_DATA_VERSION="1.9.2.4" \
	SETUP_CACHE_MAGENTO_SAMPLE_DATA_URL="https://netcologne.dl.sourceforge.net/project/mageloads/assets/1.9.2.4/magento-sample-data-1.9.2.4.zip" \
	SETUP_CACHE_MAGENTO_SAMPLE_DATA_PATH="/tmp/magento-sample-data-1.9.2.4.zip" \
	CONFIG_PROJECT_CODENAME="vanilla" \
	CONFIG_PROJECT_DESCRIPTION="Magento Vanilla" \
	CONFIG_USER="magento-vanilla" \
	CONFIG_GROUP="magento" \
	CONFIG_PATHS_TEMPLATES_REDIS="/usr/local/templates/redis.xml" \
	CONFIG_PATHS_CONFIG_REDIS="$CONFIG_PATHS_WEBROOT/app/etc/redis.xml" \
	CONFIG_SAMPLE_DATA_VERSION="1.9.2.4" \
	CONFIG_SAMPLE_DATA_INSTALL="False" \
	CONFIG_SAMPLE_DATA_URL="https://netcologne.dl.sourceforge.net/project/mageloads/assets/1.9.2.4/magento-sample-data-1.9.2.4.zip" \
	CONFIG_SAMPLE_DATA_ARCHIVE_LOCATION="/tmp/magento-sample-data-1.9.2.4.zip" \
	CONFIG_ADMIN_USERNAME="admin" \
	CONFIG_ADMIN_LASTNAME="Admin" \
	CONFIG_ADMIN_FIRSTNAME="Admin" \
	CONFIG_ADMIN_EMAIL="jhon@doe.ie" \
	CONFIG_ADMIN_PASS="password.123" \
	CONFIG_MAGENTO_VERSION="magento-mirror-1.9.3.6" \
	CONFIG_MAGENTO_USER="magento-vanilla" \
	CONFIG_MAGENTO_GROUP="magento" \
	CONFIG_MAGENTO_URL="http://www.magento.vanilla/" \
	CONFIG_MAGENTO_INSTALL_SCRIPT_URL="https://raw.githubusercontent.com/AlphaSocket/mage-install/master/install" \
	CONFIG_MAGENTO_INSTALL_SCRIPT_PATH="$CONFIG_PATHS_BINARIES/mage-install" \
	CONFIG_MAGENTO_INSTALL_FOLDER="$CONFIG_PATHS_WEBROOT" \
	CONFIG_MAGENTO_INSTALL_ENV_PATH="/usr/local/mage_install_env" \
	CONFIG_MAGENTO_USE_REWRITES="yes" \
	CONFIG_MAGENTO_USE_SECURE="no" \
	CONFIG_MAGENTO_USE_BASE_URL="" \
	CONFIG_MAGENTO_USE_SECURE_ADMIN="no" \
	CONFIG_MAGENTO_SKIP_URL_VALIDATION="yes" \
	CONFIG_MAGENTO_LOCALE="en_IE" \
	CONFIG_MAGENTO_TIMEZONE="Europe/Dublin" \
	CONFIG_MAGENTO_DEFAULT_CURRENCY="EUR" \
	CONFIG_MAGENTO_SESSION_SAVE="db" \
	CONFIG_MAGENTO_ADMIN_FRONTNAME="admin" \
	CONFIG_MAGENTO_DISABLE_CACHE="no" \
	CONFIG_MAGENTO_SET_PRIVILEGES_OWNERSHIP="no" \
	CONFIG_MAGENTO_DEVELOPER_MODE="yes" \
	CONFIG_DB_HOST="127.0.0.1" \
	CONFIG_DB_NAME="database" \
	CONFIG_DB_USER="root" \
	CONFIG_DB_PASS="root" \
	CONFIG_DB_PREFIX="" \
	CONFIG_REDIS_ENABLED="False" \
	CONFIG_REDIS_HOST="127.0.0.1" \
	CONFIG_REDIS_PORT="6379" \
	CONFIG_TURPENTINE_ENABLED="False" \
	CONFIG_TURPENTINE_BACKEND_IP="127.0.0.1" \
	CONFIG_TURPENTINE_BACKEND_PORT="8080" \
	CONFIG_TURPENTINE_BACKEND_CONTROL_PANEL_IP="127.0.0.1" \
	CONFIG_TURPENTINE_BACKEND_CONTROL_PANEL_PORT="6082" \
	CONFIG_TURPENTINE_SERVERLIST="127.0.0.1:6082" \
	CONFIG_TURPENTINE_AUTH_KEY="" \
	CONFIG_COMPOSER_INIT="yes"

RUN if [ ! -d "/usr/local/bin/setup" ]; then \
        mkdir -p /usr/local/bin/setup; \
    fi \
    && \
    if [ ! -d "/usr/local/bin/config" ]; then \
        mkdir -p /usr/local/bin/config; \
    fi

ADD bin/docker-config /usr/local/bin/docker-config
ADD bin/setup /usr/local/bin/setup/1517573202
ADD bin/config /usr/local/bin/config/1517573202
ADD imports/templates /usr/local/templates
ADD imports/mage_install_env /usr/local/mage_install_env

RUN chmod +x -R /usr/local/bin && \
    sync && \
    /usr/local/bin/setup/1517573202 


WORKDIR /var/www/html

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/usr/local/bin/docker-config && /usr/sbin/crond -f -l $CONFIG_CRON_LOG_LEVEL"]

LABEL \
    org.label-schema.vcs-ref=$BUILD_COMMIT \
    org.label-schema.vcs-url="https://github.com/AlphaSocket/dockerized-magento-vanilla"