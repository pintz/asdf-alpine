FROM alpine:latest

LABEL maintainer="the pintz <thepintz@gmail.com>"
LABEL updated_at="07/11/2025"

# adding tools
RUN apk add --no-cache bash curl kubectl ansible \
    jq kustomize helm  

# source : # Copies your code file from your action repository to the filesystem path `/` of the container
COPY toolbox/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh 

# Executes `entrypoint.sh` when the Docker container starts up
ENTRYPOINT ["/entrypoint.sh"]
