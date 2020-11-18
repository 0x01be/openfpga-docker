FROM 0x01be/iverilog as iverilog
FROM 0x01be/openfpga:build as build

FROM 0x01be/xpra

RUN apk add --no-cache --virtual openfpga-runtime-dependencies \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    libtbb-dev

COPY --from=build /opt/openfpga/ /opt/openfpga/
COPY --from=iverilog /opt/iverilog/ /opt/iverilog/

ENV PATH=${PATH}:/opt/iverilog/bin/:/opt/openfpga/bin/

#WiP
