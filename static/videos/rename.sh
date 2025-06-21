#!/usr/bin/env bash
#
# save as rename_spaces.sh, then:
#   chmod +x rename_spaces.sh
#   ./rename_spaces.sh

shopt -s nullglob   # so globs that don’t match just expand to nothing
for f in *; do
  # skip directories
  [[ -d "$f" ]] && continue

  # build the “underscored” name
  new="${f// /_}"

  # only rename if it actually changed
  if [[ "$f" != "$new" ]]; then
    echo "renaming: '$f' → '$new'"
    mv -- "$f" "$new"
  fi
done

