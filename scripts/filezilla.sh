#!/usr/bin/env bash

contents=$(curl -fsSL -A "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/81.0" "https://filezilla-project.org/download.php?show_all=1")

mkdir -p dist/
cd dist/

pattern='href="(.*cdn.*macos[^"]+)"'
for word in $contents; do
  if [[ $word =~ $pattern ]]; then
    url="${BASH_REMATCH[1]}"
    file_name=$(basename "$url" | cut -d'?' -f1)
    echo "$url"
    echo "$file_name"
    
    curl -o "$file_name" "$url"
  fi 
done
