FROM golang:1.10-alpine

ADD . /go/src/gog

RUN apk	update && apk add git
RUN go get -u github.com/levigross/grequests
RUN go get -u github.com/gorilla/mux
RUN go get -u github.com/gorilla/rpc
RUN go get -u github.com/mchirico/gog/cmd/gog
RUN go install  github.com/mchirico/gog/cmd/gog

#
#
FROM alpine:latest
RUN mkdir -p /etc/certs

# When you have certs, uncomment below
#COPY fullchain.pem /etc/certs/fullchain.pem
#COPY key.pem /etc/certs/key.pem
RUN apk	update && apk add ca-certificates && rm -rf /var/cache/apk/*



COPY --from=0 /go/bin/gog .
ENV PORT 8080
CMD ["./gog"]

# To run this
#  docker build -t us.gcr.io/mchirico/gog:latest .

#  docker push us.gcr.io/mchirico/gog:latest

#  docker run -p 8080:8080 --rm -it us.gcr.io/mchirico/gog:latest

# kubectl run hello-server --image us.gcr.io/mchirico/gog:latest --port 8080
# kubectl delete service hello-server

# // Not working ..
# kubectl rolling-update myapp --image=us.gcr.io/mchirico/hello:latest --image-pull-policy Always


