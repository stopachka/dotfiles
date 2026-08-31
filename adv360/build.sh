#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
upstream_url="https://github.com/KinesisCorporation/Adv360-Pro-ZMK.git"
upstream_commit="97f5d7394d36f60754a483bf5551e16d996fe406"
build_dir="$(mktemp -d "${TMPDIR:-/tmp}/adv360-zmk.XXXXXX")"

cleanup() {
  rm -rf "$build_dir"
}
trap cleanup EXIT

git clone --quiet "$upstream_url" "$build_dir"
git -C "$build_dir" checkout --quiet "$upstream_commit"
git -C "$build_dir" apply "$script_dir/custom-keymap.patch"

(
  cd "$build_dir"
  make
)

mkdir -p "$script_dir/firmware"
cp "$build_dir"/firmware/*-left-clique.uf2 "$script_dir/firmware/"
cp "$build_dir"/firmware/*-right-clique.uf2 "$script_dir/firmware/"

echo "Firmware written to $script_dir/firmware"
