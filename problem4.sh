#!/bin/bash
#Problem 4 extract urls from google's home page
wget http://www.google.com
grep -Eo "(http|https|ftp)://[a-zA-Z0-9./?=_-]*" index.html
