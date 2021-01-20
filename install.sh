#!/bin/sh

set -e

migrate_config() {
    if [ -f ~/.algorithmia ]; then
        echo_verbose "migrating configuration..."
        mv ~/.algorithmia ~/.algorithmia.bak
        mkdir ~/.algorithmia
        mv ~/.algorithmia.bak ~/.algorithmia/config
    fi
}

pyv=$(python -V 2>&1 | grep -Po '(?<=Python )(.+)')
if [[ -n "$pyv" ]]; then
    pipv=$(pip --version | grep -Po '(?<=pip )(.+)')
    if [[ -n "$pipv" ]]; then
        pip3 -q install algorithmia || pip -q install algorithmia || pip install algorithmia
        migrate_config
    else
        echo "Please install the Python package manager 'pip'"
    fi
else
    echo "Please install Python"
fi

