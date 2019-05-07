
FROM ubuntu:18.04

ADD toolchain_x86_glibc_2.12.tar.gz /x-tools

RUN apt update && apt install -y \
        curl \
        git \
        llvm-3.9-dev \
        libclang-3.9-dev \
        clang-3.9 \
        gcc-6-arm-linux-gnueabihf \
        libc6-dev-i386 \
        python-pip && pip install toml

# Yeah I know it is weird but this just work, 
# leave it alone and don't merge it with the line above.
RUN apt install -y gcc-arm-linux-gnueabihf

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

ENV PATH="/root/.cargo/bin:$PATH"

RUN rustup target add armv7-unknown-linux-gnueabihf

