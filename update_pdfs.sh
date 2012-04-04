#!/bin/bash

files="board.pdf board-photo.png packages/pwm-unit.pdf packages/stepper.pdf"

git stash
git checkout gh-pages
make $files
git reset --hard master
mkdir -p export
mv $files export/
git add export
git commit -m "Export"
git push -f origin gh-pages
git checkout master
echo "Any uncommitted changes are stashed"

