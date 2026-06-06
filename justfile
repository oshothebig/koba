image := "koba"
tag := "latest"

default:
    @just --list

build:
    docker build -t {{image}}:{{tag}} .
