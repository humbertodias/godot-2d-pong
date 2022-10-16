#!/bin/sh

set -e

mkdir -p build
docker run -v `pwd`:/tmp/game -w /tmp/game --entrypoint='' barichello/godot-ci:latest sh -c "godot -v --export HTML5 build/index.html"
cd build

git init
git add -A
git commit -m 'deploy'
git push -f `git config --get remote.origin.url` `git rev-parse HEAD`:gh-pages

cd -