FROM jhajjaarap/go-librdkafka:1.4.0

ENV CGO_ENABLED=0

RUN mkdir -p /go/src/handler/function && mkdir -p /go/src/handler/release
WORKDIR /go/src/handler
COPY . .

ENV GOPRIVATE="gitlab.com/ntsft/*"
ENV GONOPROXY="gitlab.com/ntsft"
ENV GONOSUMDB="gitlab.com/ntsft"
