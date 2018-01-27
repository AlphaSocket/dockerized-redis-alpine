#
# Do not change content here, image automatically built
#
FROM redis:alpine

ARG BUILD_COMMIT
ARG BUILD_TIME

ENV \
	BUILD_COMMIT=$BUILD_COMMIT \
	BUILD_DATE=$BUILD_DATE \
	GENERAL_DOCKER_USER="03192859189254" \
	GENERAL_KEYS_TRUE="True" \
	GENERAL_KEYS_FALSE="False" \
	GENERAL_KEYS_DEV="dev" \
	GENERAL_KEYS_PRD="prd" \
	BUILD_NAME="redis-alpine" \
	BUILD_BRANCH="latest" \
	BUILD_COMMIT="37a6e73" \
	BUILD_VERSION="latest" \
	BUILD_ENV="prd" \
	BUILD_PATHS_CONFIG_REDIS="/etc/redis/" \
	BUILD_REDIS_PORT="6379" \
	BUILD_DOCKERFILE_IMAGE="redis:alpine" \
	BUILD_DOCKERFILE_PORTS_MAIN="6379" \
	BUILD_DOCKERFILE_CMD="docker-entrypoint.sh $CONFIG_PATHS_CONFIG_REDIS --requirepass \"$CONFIG_REDIS_PASS\"" \
	SETUP_DEPENDENCIES_SETUP="" \
	SETUP_DEPENDENCIES_CONFIG="gettext" \
	SETUP_PATHS_CONFIG_REDIS="/etc/redis/" \
	CONFIG_PATHS_TEMPLATES_REDIS="/usr/local/templates/redis.conf" \
	CONFIG_PATHS_CONFIG_REDIS="/etc/redis//redis.conf" \
	CONFIG_REDIS_PERSISTENCE="yes" \
	CONFIG_REDIS_PASS="redis-default-pass"

RUN if [ ! -d "/usr/local/bin/setup" ]; then \
        mkdir -p /usr/local/bin/setup; \
    fi \
    && \
    if [ ! -d "/usr/local/bin/config" ]; then \
        mkdir -p /usr/local/bin/config; \
    fi

ADD bin/docker-config /usr/local/bin/docker-config
ADD bin/setup /usr/local/bin/setup/1517092162
ADD bin/config /usr/local/bin/config/1517092162

RUN chmod +x -R /usr/local/bin && \
    sync && \
    /usr/local/bin/setup/1517092162 

EXPOSE 6379 6379


ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/usr/local/bin/docker-config && docker-entrypoint.sh $CONFIG_PATHS_CONFIG_REDIS --requirepass \"$CONFIG_REDIS_PASS\""]

LABEL \
    org.label-schema.vcs-ref=37a6e73 \
    org.label-schema.vcs-url="https://github.com/AlphaSocket/dockerized-redis-alpine"