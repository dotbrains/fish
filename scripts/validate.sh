#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

find . -type f -name '*.fish' -not -path '*/.git/*' \
    -exec fish --no-execute {} +
