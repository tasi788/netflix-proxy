FROM alpine as builder
RUN apk --no-cache add ca-certificates curl bash dnsmasq grep
WORKDIR /etc
COPY . .

FROM builder
WORKDIR /etc
RUN ./init.sh
EXPOSE 53 53/udp
ENTRYPOINT ["dnsmasq", "-k"]