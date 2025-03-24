ARG RUST_VERSION

FROM rust:${RUST_VERSION}

ARG NVM_VERSION
ARG NODE_VERSION
ARG USER_ID

RUN apt update && apt upgrade -y

RUN apt install -y libwebkit2gtk-4.1-dev \
    build-essential \
    curl \
    wget \
    file \
    libxdo-dev \
    libssl-dev \
    libayatana-appindicator3-dev \
    librsvg2-dev \
    clang \
    lld

RUN apt -y autoremove && apt -y clean

RUN useradd -m -u $USER_ID -s /bin/bash tauri

USER tauri

WORKDIR /home/tauri

RUN mkdir workspace

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh | bash

ENV NVM_DIR=/home/tauri/.nvm
RUN . "$HOME/.nvm/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$HOME/.nvm/nvm.sh" && nvm alias default ${NODE_VERSION}
RUN . "$HOME/.nvm/nvm.sh" && nvm use default ${NODE_VERSION}
RUN . "$HOME/.nvm/nvm.sh" && corepack enable pnpm

RUN cargo install cargo-watch cargo-tarpaulin cargo-audit

RUN cargo install create-tauri-app --locked
