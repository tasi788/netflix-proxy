FROM alpine as builder
RUN apk --no-cache add ca-certificates curl bash dnsmasq grep
WORKDIR /etc
COPY . .

FROM builder
RUN /etc/init.sh

EXPOSE 53 53/udp
CMD ["sh","run.sh"]]