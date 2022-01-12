#!/bin/sh

install_needle(){
    needle_file="/usr/local/bin/neddle"
    if [ -f "$needle_file" ]; then
        echo "installing needle"
        brew install needle
    fi
}

generate_sources(){
    echo "Generating sources!"
    SOURCEKIT_LOGGING=0 needle generate Sources/GeneratedDependencyInjection.swift Sources
}

install_needle
generate_sources

