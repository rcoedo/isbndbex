#!/usr/bin/env bash
# Publish docs
git clone git@github.com:rcoedo/isbndbex isbndbex-doc
cd isbndbex-doc
git checkout gh-pages
rm -rf *
cp -r ../doc/* .
git add --all
git commit -a -m "Update docs"
git push origin gh-pages
cd ../
rm -rf isbndbex-doc
