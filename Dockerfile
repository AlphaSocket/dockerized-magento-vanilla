#
# Do not change content here, image automatically built
#
FROM registry.hub.docker.com/alphasocket/magento-cli-alpine:latest

ARG BUILD_COMMIT
ARG BUILD_TIME

ENV \
	BUILD_COMMIT=$BUILD_COMMIT \
	BUILD_DATE=$BUILD_DATE \
	GENERAL_DOCKER_USER="03192859189254" \
	GENERAL_DOCKER_REGISTRY="registry.hub.docker.com" \
	GENERAL_KEYS_TRUE="True" \
	GENERAL_KEYS_FALSE="False" \
	GENERAL_KEYS_DEV="dev" \
	GENERAL_KEYS_PRD="prd" \
	BUILD_NAME="magento-vanilla" \
	BUILD_BRANCH="latest" \
	BUILD_VERSION="latest" \
	BUILD_ENV="prd" \
	BUILD_DOCKERFILE_IMAGE="registry.hub.docker.com/alphasocket/magento-cli-alpine:latest" \
	BUILD_DOCKERFILE_WORKDIR="/var/www/html" \
	BUILD_DOCKERFILE_CMD="/usr/sbin/crond -f -l $CONFIG_CRON_LOG_LEVEL" \
	SETUP_MAGENTO_INSTALL_SCRIPT_URL="https://raw.githubusercontent.com/AlphaSocket/mage-install/master/install" \
	SETUP_MAGENTO_INSTALL_SCRIPT_PATH="$CONFIG_PATHS_BINARIES/mage-install" \
	SETUP_DEPENDENCIES_SETUP="" \
	SETUP_DEPENDENCIES_CONFIG="" \
	CONFIG_PROJECT_CODENAME="vanilla" \
	CONFIG_PROJECT_DESCRIPTION="Magento Vanilla" \
	CONFIG_USER="magento-vanilla" \
	CONFIG_GROUP="magento" \
	CONFIG_ADMIN_USERNAME="admin" \
	CONFIG_ADMIN_LASTNAME="Admin" \
	CONFIG_ADMIN_FIRSTNAME="Admin" \
	CONFIG_ADMIN_EMAIL="jhon@doe.ie" \
	CONFIG_ADMIN_PASS="password.123" \
	CONFIG_MAGENTO_VERSION="magento-mirror-1.9.3.6" \
	CONFIG_MAGENTO_USER="magento-vanilla" \
	CONFIG_MAGENTO_GROUP="magento" \
	CONFIG_MAGENTO_URL="http://www.magento.vanilla/" \
	CONFIG_MAGENTO_INSTALL_FOLDER="/var/www/html" \
	CONFIG_MAGENTO_INSTALL_ENV_PATH="/usr/local/mage_install_env" \
	CONFIG_MAGENTO_USE_REWRITES="yes" \
	CONFIG_MAGENTO_USE_SECURE="no" \
	CONFIG_MAGENTO_USE_BASE_URL="" \
	CONFIG_MAGENTO_USE_SECURE_ADMIN="no" \
	CONFIG_MAGENTO_SKIP_URL_VALIDATION="yes" \
	CONFIG_MAGENTO_LOCALE="en_IE" \
	CONFIG_MAGENTO_TIMEZONE="Europe/Dublin" \
	CONFIG_MAGENTO_CURRENCY="EUR" \
	CONFIG_MAGENTO_SESSION_SAVE="db" \
	CONFIG_MAGENTO_ADMIN_FRONTNAME="admin" \
	CONFIG_MAGENTO_BACKEND_FRONTNAME="admin" \
	CONFIG_MAGENTO_DISABLE_CACHE="no" \
	CONFIG_MAGENTO_SET_PRIVILEGES_OWNERSHIP="no" \
	CONFIG_MAGENTO_DEVELOPER_MODE="yes" \
	CONFIG_DB_HOST="127.0.0.1" \
	CONFIG_DB_NAME="database" \
	CONFIG_DB_USER="root" \
	CONFIG_DB_PASS="root" \
	CONFIG_DB_PREFIX="" \
	CONFIG_COMPOSER_INIT="no"

RUN if [ ! -d "/usr/local/bin/setup" ]; then \
        mkdir -p /usr/local/bin/setup; \
    fi \
    && \
    if [ ! -d "/usr/local/bin/config" ]; then \
        mkdir -p /usr/local/bin/config; \
    fi

ADD bin/docker-config /usr/local/bin/docker-config
ADD bin/setup /usr/local/bin/setup/1516977680
ADD bin/config /usr/local/bin/config/1516977680
ADD mage_install_env /usr/local/mage_install_env

RUN chmod +x -R /usr/local/bin && \
    sync && \
    /usr/local/bin/setup/1516977680 


WORKDIR /var/www/html

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/usr/local/bin/docker-config && /usr/sbin/crond -f -l $CONFIG_CRON_LOG_LEVEL"]

LABEL \
    org.label-schema.vcs-ref=$BUILD_COMMIT \
    org.label-schema.vcs-url="https://github.com/AlphaSocket/dockerized-magento-vanilla"