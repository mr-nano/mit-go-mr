#!/bin/sh

export GOPATH=/workspaces/mit-go-mr
alias gst="git status"
go env -w GO111MODULE=off
cd src/main
rm mr-out*
go build -race -buildmode=plugin ../mrapps/wc.go
go run -race mrsequential.go wc.so pg*.txt
more mr-out-0