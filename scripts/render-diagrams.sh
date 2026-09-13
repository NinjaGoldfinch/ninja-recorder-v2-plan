#!/usr/bin/env bash
#
# Render every Mermaid source under docs/diagrams/src/ to a PNG under
# docs/diagrams/png/.
#
# The .mmd files are the source of truth; the PNGs are generated output and must
# never be hand-edited. Commit the source change and the re-rendered PNG together —
# CI checks that every source has a matching render.
#
# Usage: ./scripts/render-diagrams.sh [name ...]
#   With no arguments, renders everything. With names (with or without the .mmd
#   extension), renders only those.

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
src_dir="$repo_root/docs/diagrams/src"
png_dir="$repo_root/docs/diagrams/png"

if ! command -v mmdc >/dev/null 2>&1; then
  echo "error: mmdc not found — install it with: npm install -g @mermaid-js/mermaid-cli" >&2
  exit 1
fi

mkdir -p "$png_dir"

if [ "$#" -gt 0 ]; then
  sources=()
  for arg in "$@"; do
    sources+=("$src_dir/$(basename "$arg" .mmd).mmd")
  done
else
  shopt -s nullglob
  sources=("$src_dir"/*.mmd)
fi

if [ "${#sources[@]}" -eq 0 ]; then
  echo "error: no .mmd sources found in $src_dir" >&2
  exit 1
fi

rendered=0
for src in "${sources[@]}"; do
  if [ ! -f "$src" ]; then
    echo "error: no such source: $src" >&2
    exit 1
  fi
  name="$(basename "$src" .mmd)"
  out="$png_dir/$name.png"
  echo "  $name.mmd -> png/$name.png"
  mmdc -i "$src" -o "$out" -b white -w 1200 -s 2
  rendered=$((rendered + 1))
done

echo "rendered $rendered diagram(s) into docs/diagrams/png/"
