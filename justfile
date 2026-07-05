image := "koba"
tag := "latest"

default:
    @just --list

build:
    docker build -t {{ image }}:{{ tag }} .

run:
    docker run --rm -it \
    -v "$(pwd):/workspace" \
    -v "{{ home_directory() }}/.config/git/config:/root/.config/git/config:ro" \
    {{ image }}:{{ tag }} \
    bash
