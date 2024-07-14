#!/bin/bash

current=$(git branch --show-current)
git checkout $1
result=`git status`
git checkout $current
echo $result
