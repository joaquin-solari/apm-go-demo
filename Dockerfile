FROM golang:alpine3.15

WORKDIR /src/
COPY app.go go.* /src/
COPY static /app/static

# Instala el agente Elastic APM para Go
RUN go get -u go.elastic.co/apm
RUN go get -u go.elastic.co/apm/module/apmhttp
RUN go get github.com/gorilla/mux
RUN CGO_ENABLED=0 go build -o /bin/app

ENV PUERTO=8085 

EXPOSE 8085/tcp
ENTRYPOINT ["/bin/app"]
