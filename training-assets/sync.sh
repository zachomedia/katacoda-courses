#!/usr/bin/env bash

FILES=`find ../*/*/assets`

for f in $FILES; do
  echo "${f}"
  dn=`dirname "$f"`
  mkdir -p ${dn:1}
  cp -f -p $f ${dn:1}
done

#git add .
#git commit -m "syncing training assets to public repo"
#git push
