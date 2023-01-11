#!/bin/bash

find . -name ".DS_Store" -print -delete
git add .
git status
echo "Enter your commit message: "
read message
git commit -m "$message"
git push
