FROM 0x01be/iverilog as iverilog
FROM 0x01be/openfpga:build as build

FROM 0x01be/xpra

COPY --from=build /opt/openfpga /opt/openfpga
COPY --from=iverilog /opt/openfpga /opt/openfpga

ENV PATH=${PATH}:/opt/iverilog/bin/:/opt/openfpga/bin/

#WiP
