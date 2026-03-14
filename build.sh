#!/bin/sh

process_scheme() {
    for f in "palettes/$1"/*; do
        local palette="${f##*/}"
        local target="build/$1_$palette.toml"
        echo "  $palette -> $target"
        cat "schemes/$1" "$f" > $target
    done
}

mkdir -p build

for f in schemes/*; do
    scheme="${f##*/}"
    echo
    echo "$scheme:"
    process_scheme "$scheme"
done
