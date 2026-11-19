#!/bin/bash

count_files() {
    ls -1 | wc -l
}

evaluate_guess() {
    local guess=$1
    local actual=$2
    if [[ $guess -lt $actual ]]; then
        echo "Too low! Try again:"
        return 1
    elif [[ $guess -gt $actual ]]; then
        echo "Too high! Try again:"
        return 1
    else
        echo "Congratulations! You guessed it right!"
        return 0
    fi
}

main() {
    local file_count=$(count_files)
    echo "How many files are in the current directory?"
    read guess
    while true; do
        if evaluate_guess "$guess" "$file_count"; then
            break
        fi
        read guess
    done
}

main