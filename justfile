image := "koba"
tag := "latest"

default:
    @just --list

build:
    docker build -t {{ image }}:{{ tag }} .

run:
    docker run --rm -it \
    -v "$(pwd):/workspace" \
    {{ image }}:{{ tag }} \
    bash
