FROM alpine

RUN apk add --no-cache --virtual openfpga-build-dependencies \
    git \
    build-base \
    cmake \
    bison \
    flex \
    readline-dev \
    gtk+3.0-dev

RUN apk add --no-cache --virtual openfpga-edge-build-dependencies \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    libtbb-dev

ENV REVISION=master
RUN git clone --depth 1 --branch ${REVISION} https://github.com/LNIS-Projects/OpenFPGA.git /openfpga

WORKDIR /openfpga/build

RUN cmake \
    -DCMAKE_INSTALL_PREFIX=/opt/openfpga \
    -DVPR_USE_EZGL=on \
    ..
RUN make
RUN make install

