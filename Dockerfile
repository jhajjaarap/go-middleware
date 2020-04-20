FROM openfaas/of-watchdog:0.7.7 as watchdog
FROM jhajjaarap/go-librdkafka:1.4.0 as build

COPY --from=watchdog /fwatchdog /usr/bin/fwatchdog
RUN chmod +x /usr/bin/fwatchdog

ENV CGO_ENABLED=0

RUN mkdir -p /go/src/handler
WORKDIR /go/src/handler
COPY . .

ENV GOPRIVATE="gitlab.com/ntsft/*"
ENV GONOPROXY="gitlab.com/ntsft"
ENV GONOSUMDB="gitlab.com/ntsft"
