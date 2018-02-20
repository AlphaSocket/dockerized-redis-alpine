# alphasocket/dockerized-redis-alpine
#### redis-alpine
Redis service with pass configurable in ENV


| [![Build Status](https://semaphoreci.com/api/v1/alphasocket/dockerized-redis-alpine/branches/latest/badge.svg)](https://semaphoreci.com/alphasocket/dockerized-redis-alpine) | Size / Layers | Version |
| ----- | ----- | ----- |
| Dev image | [![](https://images.microbadger.com/badges/image/03192859189254/dockerized-redis-alpine:latest.svg)](https://microbadger.com/images/03192859189254/redis-alpine:latest ) | [![](https://images.microbadger.com/badges/version/03192859189254/dockerized-redis-alpine:latest.svg)](https://microbadger.com/images/03192859189254/redis-alpine:latest) |
| Prd image | [![](https://images.microbadger.com/badges/image/alphasocket/redis-alpine:latest.svg)](https://microbadger.com/images/alphasocket/redis-alpine:latest ) | [![](https://images.microbadger.com/badges/version/alphasocket/redis-alpine:latest.svg)](https://microbadger.com/images/alphasocket/redis-alpine:latest) |

## Branches & Versions
- latest


## Packages installed
- Config dependencies:
  + gettext


## Configurable envvars
~~~
CONFIG_GROUPS_MAIN_ID="1000"
CONFIG_GROUPS_MAIN_NAME="docker"
CONFIG_GROUPS_ADDITIONAL_ID="1001"
CONFIG_GROUPS_ADDITIONAL_NAME=""
CONFIG_USERS_MAIN_ID="1000"
CONFIG_USERS_MAIN_NAME="docker"
CONFIG_USERS_MAIN_GROUPS="docker"
CONFIG_USERS_ADDITIONAL_ID="1001"
CONFIG_USERS_ADDITIONAL_NAME=""
CONFIG_USERS_ADDITIONAL_GROUPS=""
CONFIG_REDINESS_TEST="true"
CONFIG_LIVENESS_TEST="true"
CONFIG_PATHS_CONTAINER_STATUS="/tmp/container_status"
CONFIG_PATHS_TEMPLATES_REDIS="/usr/local/templates/redis.conf"
CONFIG_PATHS_CONFIG_REDIS="/etc/redis//redis.conf"
CONFIG_REDIS_PERSISTENCE="yes"
CONFIG_REDIS_PASS="redis-default-pass"
~~~
