#!/bin/sh
# Convert plain-text quotes into bootstrap-aware HTML.
# Copyright 2013 Tom Vincent <http://tlvince.com/contact>

src="${1:-$HOME/doc/pim/quotes.txt}"
[ -f "$src" ] || { echo "$0 quotes.txt" && exit 1; }

# Expects unwrapped, newline seperated quotes in the format:
#   "Quote" --- Source
sed \
  -e 's_^"_<blockquote><p>_' \
  -e 's_" --- _</p><small>_' \
  -e 's_$_</small></blockquote>_' \
  "$src" | \
  pandoc --standalone --normalize --smart --from=markdown
