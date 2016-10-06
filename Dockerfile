FROM golang:latest

RUN apt-get update && \
    apt-get -y install git && \
    go get -u github.com/Masterminds/glide && \
    git clone https://github.com/btcsuite/btcd $GOPATH/src/github.com/btcsuite/btcd && \
    cd $GOPATH/src/github.com/btcsuite/btcd && \
    glide install && \
    go install . ./cmd/...

RUN git clone https://github.com/btcsuite/btcwallet $GOPATH/src/github.com/btcsuite/btcwallet && \
    cd $GOPATH/src/github.com/btcsuite/btcwallet && \
    glide install && \
    go install . ./cmd/...

EXPOSE [8333, 8334]
