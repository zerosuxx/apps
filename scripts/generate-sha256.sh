#!/usr/bin/env bash

folder="$1"

for file in $folder/*; do
  ext="${file##*.}"
  if [[ "$ext" == "sha256" ]]; then
    continue
  fi
  cat "$file" | sha256sum | cut -d' ' -f1 | tee "$file.sha256" 
done