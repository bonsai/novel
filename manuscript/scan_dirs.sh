#!/bin/bash
cd /home/bons/repos
for d in */; do
  d="${d%/}"
  echo "## $d"
  ls -a "$d" | head -8
  echo
done