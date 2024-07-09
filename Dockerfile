FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /build

# install tools and dependencies
RUN apt-get -y update && \
	apt-get upgrade -y && \
	apt-get install -y --no-install-recommends \
	curl make cmake file ca-certificates clang git \
	g++ gcc-aarch64-linux-gnu g++-aarch64-linux-gnu \
	libc6-dev-arm64-cross binutils-aarch64-linux-gnu \
	&& \
	apt-get clean

# install rustup
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

# rustup directory
ENV PATH /root/.cargo/bin:$PATH

# build OpenEthereum
COPY src /build/openethereum
RUN git clone https://github.com/openethereum/openethereum /build/openethereum/git && \
  cd /build/openethereum/git && \
  rustup override set 1.60.0 && \
  cargo build --release --features final

RUN chmod -R 767 /build/openethereum && \
    mkdir /build/openethereum/worker && \
    mkdir /build/openethereum/log

#USER root

#CMD ["/build/openethereum/git/target/release/openethereum", "--config", "/build/openethereum/config.toml"]

EXPOSE 8080 8545 8180
#ENTRYPOINT ["/build/openethereum/git/target/release/openethereum", "--config", "/build/openethereum/config.toml"]
