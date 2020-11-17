FROM 0x01be/openfpga:build as build

FROM 0x01be/xpra

COPY --from=build /opt/openfpga /opt/openfpga/

#WiP
