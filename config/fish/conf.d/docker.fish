# setup docker here
set -x DOCKER_PATH "$HOME/.docker"
set -x PATH $PATH $DOCKER_PATH/bin
test -d "$DOCKER_PATH" || mkdir "$DOCKER_PATH"
