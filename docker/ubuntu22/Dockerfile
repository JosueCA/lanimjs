FROM ubuntu:22.04
MAINTAINER JosueCA

LABEL maintainer.name="JosueCA"

ARG APP_DIRECTORY_NAME=lanimjs-git
ARG WORKSPACE_DIRECTORY_NAME=workspace
ARG HOST_USER_UID=1000
ARG HOST_USER_GID=1000
ARG USER_NAME=lanimjs
ARG DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update && apt-get install -y \
    git \
    nano \
    curl \
    build-essential \
    python3 \
    && apt-get clean

RUN groupadd -g $HOST_USER_GID $USER_NAME && \
    useradd -lm -u $HOST_USER_UID -g $HOST_USER_GID $USER_NAME -s /bin/bash

USER $USER_NAME
WORKDIR /home/$USER_NAME/

# nvm-sh instructions:
# https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-in-docker
# Use bash for the shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Create a script file sourced by both interactive and non-interactive bash shells
ENV BASH_ENV /home/$USER_NAME/.bash_env
RUN touch "${BASH_ENV}"
RUN echo '. "${BASH_ENV}"' >> ~/.bashrc

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | PROFILE="${BASH_ENV}" bash
RUN echo node > .nvmrc
RUN nvm install
# nvm-sh end

WORKDIR /home/$USER_NAME/$WORKSPACE_DIRECTORY_NAME

COPY build.sh /home/$USER_NAME/build.sh

CMD ["/bin/bash"]
