FROM alpine:latest

LABEL maintainer="the pintz <thepintz@gmail.com>"
LABEL updated_at="02/12/2024"

# coreutils should add standard sort 

RUN apk add --virtual .asdf-deps --no-cache bash curl git python3 coreutils
SHELL ["/bin/bash", "-l", "-c"]
RUN adduser -s /bin/bash -h /asdf -D asdf
ENV PATH="${PATH}:/asdf/.asdf/shims:/asdf/.asdf/bin"

USER asdf
WORKDIR /asdf

COPY poetry/tool-versions /asdf/.tool-versions

USER asdf
RUN git clone --depth 1 https://github.com/asdf-vm/asdf.git $HOME/.asdf && \
    echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc && \
    echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.profile && \
    source ~/.bashrc && \
    mkdir -p $HOME/.asdf/toolset

RUN for PKG in "$(cat /asdf/.tool-versions | grep -v '^#' | awk '{print $1}')"; do asdf plugin add ${PKG}; done && \
    asdf install

