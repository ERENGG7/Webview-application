#!/bin/bash


while true; do
    read "REPOSITORY_LINK?Enter link to git repository: "

    if [ -z "$REPOSITORY_LINK" ]; then
        echo "Error: The repository link cannot be empty."
        continue 
    fi
    break
done

git remote add origin "$REPOSITORY_LINK"
git branch -m main

echo "Pushing code to GitHub..."
git push -u origin main

echo "Project successfully linked and uploaded to GitHub!"