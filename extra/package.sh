#!/bin/bash

set -xeu -o pipefail

MOD_NAME="npc_armor"
SFALL_VERSION=4.5.1
MPACK_VERSION=4.5.1
DAT3_VERSION="v0.11.1"
DAT3_URL="https://github.com/BGforgeNet/dat3/releases/download/${DAT3_VERSION}/dat3"
EXTRA_DIR="$(realpath extra)"
DAT3="$EXTRA_DIR/bin/dat3"
# zlib level for every .dat: 6 packs in under half the time of 9, for archives about 1% larger.
DAT3_LEVEL=6
# Release archives, fetched only when missing; CI caches this directory.
DOWNLOADS_DIR="$EXTRA_DIR/downloads"
data_dir="$(realpath data)"
release_dir="$(realpath release)"
mods_dir="${release_dir}/mods"

# Download dat3 tool if it doesn't exist
if [[ ! -f "$DAT3" ]]; then
    mkdir -p "$EXTRA_DIR/bin"
    # Through a temporary name, so an interrupted download is never taken for a complete one.
    wget -q "$DAT3_URL" -O "$DAT3.part"
    chmod +x "$DAT3.part"
    mv "$DAT3.part" "$DAT3"
fi

# package filename
short_sha="$(git rev-parse --short HEAD)"
version="git$short_sha"
if [[ -n "${GITHUB_REF-}" ]]; then
    if echo "$GITHUB_REF" | grep "refs/tags"; then # tagged
        # shellcheck disable=SC2001 # we are fine with sed, thank you
        version="$(echo "$GITHUB_REF" | sed 's|refs\/tags\/||')"
    fi
fi
zip="${MOD_NAME}_${version}.zip"

# prepare
mkdir -p "$mods_dir" "$DOWNLOADS_DIR"
cd "$data_dir"

# Through a temporary name, so an interrupted download is never taken for a complete one.
mpack_archive="$DOWNLOADS_DIR/modderspack_$MPACK_VERSION.7z"
if [[ ! -f "$mpack_archive" ]]; then
    wget -nv "https://sourceforge.net/projects/sfall/files/Modders%20pack/modderspack_$MPACK_VERSION.7z/download" -O "$mpack_archive.part"
    mv "$mpack_archive.part" "$mpack_archive"
fi
sfall_archive="$DOWNLOADS_DIR/sfall_$SFALL_VERSION.7z"
if [[ ! -f "$sfall_archive" ]]; then
    wget -nv "https://sourceforge.net/projects/sfall/files/sfall/sfall_$SFALL_VERSION.7z/download" -O "$sfall_archive.part"
    mv "$sfall_archive.part" "$sfall_archive"
fi

# script and ini from modderspack
7zr e "$mpack_archive" mods/gl_npcarmor.int mods/npcarmor.ini
mv npcarmor.ini "$mods_dir/"
mkdir -p scripts
mv gl_npcarmor.int scripts/

# sfall
7zr e "$sfall_archive" ddraw.dll
mv ddraw.dll "$release_dir"/

# pack .dat
"$DAT3" a -c "$DAT3_LEVEL" -C "$data_dir" "$mods_dir/${MOD_NAME}.dat" '*'

cd "$release_dir"

# .dat files are already compressed: storing them is far faster, deflate gains nothing.
zip -r -n .dat "$zip" ./*
mv "$zip" ..
