#!/bin/sh
git push
git subtree push --prefix backend origin heroku
git subtree push --prefix frontend origin netlify