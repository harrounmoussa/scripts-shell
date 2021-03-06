#!/bin/sh
# Replaces a human-readable image directive with an in-line Markdown equivalent.
# Author: Tom Vincent <http://tlvince.com/contact/>
#
# Examples
#
#   image: hello.png
#   The images alt text
#
#   # =>
#
#     [![The images alt text](http://tlvince.appspot.com/img/th/hello.png)](http://tlvince.appspot.com/img/hello.png)
#
# Modified from a Perl one-liner by John MacFarlane:
# http://johnmacfarlane.net/pandoc/epub.html#a-real-book

root="http:\/\/tlvince.appspot.com\/img"
perl -i -0pe \
"s/^  image:\s*(.*)\s*\n  ([^\n]*)$/  [!\[\2]($root\/th\/\1)]($root\/\1)/mg" "$@"
