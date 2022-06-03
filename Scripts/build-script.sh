#!/bin/sh

install_needle(){
    needle_file=$(which needle)
    if [ -f "$needle_file" ]; then
        echo "installing needle"
        brew install needle
    fi
}

generate_sources(){
    needle_command=$(which needle)
    echo "Generating sources!"
    SOURCEKIT_LOGGING=0 /opt/homebrew/bin/needle generate Sources/NeedleGenerated.swift Sources
}

install_needle
generate_sources
