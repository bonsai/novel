#!/bin/bash
# map local dirs -> GH repo (case-insensitive exact, then fuzzy), categorize
cd /home/bons/repos
gh repo list bonsai --limit 500 --json name --jq '.[].name' > /tmp/ghrepos.txt 2>/dev/null
mapfile -t gharr < /tmp/ghrepos.txt

lc() { tr '[:upper:]' '[:lower:]' <<<"$1"; }

for d in */; do
  d="${d%/}"
  dl=$(lc "$d")
  # case-insensitive exact match
  match=""
  for g in "${gharr[@]}"; do
    gl=$(lc "$g")
    if [ "$gl" = "$dl" ]; then match="$g"; break; fi
  done
  # fuzzy: strip separators
  if [ -z "$match" ]; then
    norm=$(tr -d '_-' <<<"$dl")
    for g in "${gharr[@]}"; do
      gl=$(lc "$g")
      if [ "$(tr -d '_-' <<<"$gl")" = "$norm" ]; then match="$g"; break; fi
    done
  fi
  files=$(find "$d" -mindepth 1 -maxdepth 1 | wc -l)
  echo -e "${d}\t${match:-NONE}\t${files}"
done