#!/bin/bash

while true; do
    read -r - p"Enter commit message: " commit_message?
    if [[ -z "$commit_message" ]]; then
        echo "Commit message can't be empty!"
        continue
    fi
    
    git add .
    git commit -m "$commit_message"
    git push -u origin main
    break
done