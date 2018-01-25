FROM quay.io/alphasocket/magento-cli:latest

ENV \
    MAGENTO_INSTALL_ENV_PATH="/usr/local/mage_install_env" \ 
    MAGENTO_INSTALL_SCRIPT_URL="https://raw.githubusercontent.com/AlphaSocket/mage-install/master/install" \
    MAGENTO_INSTALL_SCRIPT_PATH="$CONFIG_PATHS_BINARIES/mage-install" \
    PROJECT_CODENAME="vanilla" \
    PROJECT_DESCRIPTION="Magento Vanilla" \
    INSTALLATION_FOLDER="/var/www/html" \
    MAGENTO_VERSION="magento-mirror-1.9.3.6" \
    MAGENTO_LOCALE="en_IE" \
    MAGENTO_TIMEZONE="Europe/Dublin" \
    MAGENTO_DEFAULT_CURRENCY="EUR" \
    DB_HOST="127.0.0.2" \
    DB_NAME="database" \
    DB_USER="root" \
    DB_PASS="root" \
    DB_PREFIX="pre_" \
    MAGENTO_URL="http://www.magento.vanilla/" \
    MAGENTO_USE_REWRITES="yes" \
    MAGENTO_USE_SECURE="no" \
    MAGENTO_SECURE_BASE_URL="" \
    MAGENTO_USE_SECURE_ADMIN="no" \
    MAGENTO_SKIP_URL_VALIDATION="yes" \
    ADMIN_USERNAME="admin" \
    ADMIN_LASTNAME="Admin" \
    ADMIN_FIRSTNAME="Admin" \
    ADMIN_EMAIL="jhon@doe.ie" \
    ADMIN_PASS="password.123" \
    MAGENTO_SESSION_SAVE="db" \
    MAGENTO_ADMIN_FRONTNAME="admin" \
    MAGENTO_BACKEND_FRONTNAME="admin" \
    MAGENTO_DISABLE_CACHE="no" \
    MAGENTO_SET_PRIVILEGES_OWNER="no" \
    MAGENTO_USER="$CONFIG_USER" \
    $MAGENTO_GROUP="$CONFIG_GROUP" \
    COMPOSER_INIT="no" \
    MAGENTO_DEVELOPER_MODE="yes" \

ADD mage_install_env $MAGENTO_INSTALL_ENV

RUN curl -o $MAGENTO_INSTALL_SCRIPT_PATH $MAGENTO_INSTALL_SCRIPT_URL && chmod +x $MAGENTO_INSTALL_SCRIPT_PATH

WORKDIR /var/www/html

CMD ["/usr/local/bin/config && $MAGENTO_INSTALL_SCRIPT_PATH $MAGENTO_INSTALL_ENV && /usr/sbin/crond -f -l $CONFIG_CRON_LOG_LEVEL"]