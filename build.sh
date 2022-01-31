#!/bin/sh

process_theme() {
    for f in "palettes/$1"/*; do
        local palette="${f##*/}"
        local target="build/$1_$palette.toml"
        echo "  $palette -> $target"
        cat "themes/$1" "$f" > $target
    done
}

mkdir -p build

for f in themes/*; do
    theme="${f##*/}"
    echo
    echo "$theme:"
    process_theme "$theme"
done
