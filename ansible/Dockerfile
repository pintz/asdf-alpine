FROM alpine:latest

LABEL maintainer="the pintz <thepintz@gmail.com>"
LABEL updated_at="02/12/2024"

# coreutils should add standard sort 

RUN apk add --virtual .asdf-deps --no-cache bash curl git coreutils
SHELL ["/bin/bash", "-l", "-c"]
RUN adduser -s /bin/bash -h /asdf -D asdf
ENV PATH="${PATH}:/root/.asdf/shims:/root/.asdf/bin"

USER root
WORKDIR /root

COPY ansible/tool-versions /root/.tool-versions
COPY ansible/entrypoint.sh /entrypoint.sh

RUN git clone --depth 1 https://github.com/asdf-vm/asdf.git $HOME/.asdf && \
    echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc && \
    echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.profile && \
    source ~/.bashrc && \
    mkdir -p $HOME/.asdf/toolset

RUN for PKG in "$(cat /root/.tool-versions | grep -v '^#' | awk '{print $1}')"; do asdf plugin add ${PKG}; done && \
    asdf install

ENTRYPOINT /entrypoint.sh
