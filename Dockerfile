#
# Do not change content here, image automatically built
#
FROM redis:alpine

ARG BUILD_COMMIT
ARG BUILD_DATE

ENV \
	GENERAL_DOCKER_USERS_DEV="03192859189254" \
	GENERAL_DOCKER_USERS_PRD="alphasocket" \
	GENERAL_DOCKER_USER="alphasocket" \
	GENERAL_DOCKER_REGISTRIES_DEV="docker.io" \
	GENERAL_DOCKER_REGISTRIES_PRD="docker.io" \
	GENERAL_DOCKER_REGISTRY="docker.io" \
	GENERAL_KEYS_TRUE="True" \
	GENERAL_KEYS_FALSE="False" \
	GENERAL_KEYS_DEV="dev" \
	GENERAL_KEYS_PRD="prd" \
	BUILD_USER="03192859189254" \
	BUILD_REGISTRY="docker.io" \
	BUILD_REPO="https://github.com/alphaSocket/dockerized-redis-alpine" \
	BUILD_BRANCH="latest" \
	BUILD_VERSION="latest" \
	BUILD_ENV="prd" \
	BUILD_PATHS_CONFIG_REDIS="/etc/redis/" \
	BUILD_NAME="redis-alpine" \
	BUILD_FROM="redis:alpine" \
	BUILD_CMD="docker-entrypoint.sh $CONFIG_PATHS_CONFIG_REDIS --requirepass \"$CONFIG_REDIS_PASS\"" \
	BUILD_REDIS_PORT="6379" \
	BUILD_PORTS_ADDITIONAL="" \
	BUILD_PORTS_MAIN="6379" \
	SETUP_DEPENDENCIES_RUNTIME="" \
	SETUP_DEPENDENCIES_SETUP="" \
	SETUP_DEPENDENCIES_CONFIG="gettext" \
	SETUP_PATHS_BINARIES="/usr/local/bin" \
	SETUP_PATHS_SETUP="/usr/local/bin/setup" \
	SETUP_PATHS_CONFIG="/usr/local/bin/config" \
	CONFIG_REDINESS_TEST="true" \
	CONFIG_LIVENESS_TEST="true" \
	CONFIG_GROUPS_ADDITIONAL_ID="1001" \
	CONFIG_GROUPS_ADDITIONAL_NAME="" \
	CONFIG_GROUPS_MAIN_ID="1063" \
	CONFIG_GROUPS_MAIN_NAME="redis" \
	CONFIG_USERS_ADDITIONAL_ID="1001" \
	CONFIG_USERS_ADDITIONAL_NAME="" \
	CONFIG_USERS_ADDITIONAL_GROUPS="" \
	CONFIG_USERS_MAIN_ID="1063" \
	CONFIG_USERS_MAIN_NAME="redis" \
	CONFIG_USERS_MAIN_GROUPS="redis" \
	CONFIG_PATHS_CONTAINER_STATUS="/tmp/container_status" \
	CONFIG_PATHS_TEMPLATES_REDIS="/usr/local/templates/redis.conf" \
	CONFIG_PATHS_CONFIG_REDIS="/etc/redis//redis.conf" \
	CONFIG_REDIS_PERSISTENCE="yes" \
	CONFIG_REDIS_PASS="redis-default-pass"
ADD imports/bin/docker-config /usr/local/bin/docker-config
ADD imports/bin/docker-run /usr/local/bin/docker-run
ADD imports/bin/docker-rediness-test /usr/local/bin/docker-rediness-test
ADD imports/bin/docker-liveness-test /usr/local/bin/docker-liveness-test
ADD imports/bin/setup /usr/local/bin/setup/1519340744
ADD imports/bin/config /usr/local/bin/config/1519340744
ADD imports/templates/redis.conf /usr/local/templates/redis.conf


RUN chmod +x -R /usr/local/bin && \
    sync && \
    /usr/local/bin/setup/1519340744 1>/dev/stdout 2>/dev/stderr

EXPOSE 6379 


ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/usr/local/bin/docker-run"]

LABEL \
    org.label-schema.vcs-ref="$BUILD_COMMIT" \
    org.label-schema.vcs-url="https://github.com/alphaSocket/dockerized-redis-alpine"