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

if  python --version "$1" > /dev/null 2>&1; then
    if  pip --version "$1" > /dev/null 2>&1; then
        pip3 -q install algorithmia || pip -q install algorithmia || pip install algorithmia
        migrate_config
    else
        echo "Please install the Python package manager 'pip'"
    fi
else
    echo "Please install Python"
fi

