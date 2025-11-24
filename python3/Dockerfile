FROM alpine:latest

LABEL maintainer="the pintz <thepintz@gmail.com>"
LABEL updated_at="07/11/2025"

# will install uv binaries from the astral container
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# adding tools
RUN apk add --no-cache bash python3  \
    jq  

# source : # Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh 

# Executes `entrypoint.sh` when the Docker container starts up
ENTRYPOINT ["/entrypoint.sh"]
