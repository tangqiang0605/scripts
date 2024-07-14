#!/bin/bash

target="${1:-dev}"
current="${2:-$(git branch --show-current)}"

git checkout $target
git merge $current

# 合并冲突

git pull
git push origin $target

