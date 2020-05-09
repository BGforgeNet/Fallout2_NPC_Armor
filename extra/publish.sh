#!/bin/bash

set -xeu -o pipefail

bin_dir="$(realpath $bin_dir)"
dat2a="wine $bin_dir/dat2.exe a -1"
file_list="$(realpath file.list)"
release_dir="$(realpath $release_dir)"
mods_dir="${release_dir}/mods"

# release?
if [ -n "$TRAVIS_TAG" ]; then # tag found: releasing
  mod_version="$(echo $TRAVIS_TAG | tr -d 'v')" # numeric
else
  mod_version="git$TRAVIS_COMMIT"
fi
zip="${mod_name}_v${mod_version}.zip"

mkdir -p "$mods_dir"
cd "$data_dir"

# script and ini from modderspack
mpack_file="modderspack_$mpack_version.7z"
mpack_url="https://sourceforge.net/projects/sfall/files/Modders%20pack/$mpack_file/download"
mpack_archive="mpack.7z"
wget -q "$mpack_url" -O $mpack_archive
7zr e $mpack_archive mods/gl_npcarmor.int mods/npcarmor.ini
mv npcarmor.ini "$mods_dir/"
mkdir -p scripts
mv gl_npcarmor.int scripts/
rm -f $mpack_archive

# sfall
sfall_url="https://sourceforge.net/projects/sfall/files/sfall/sfall_$sfall_version.7z/download"
sfall_archive="sfall.7z"
wget -q "$sfall_url" -O $sfall_archive
7zr e $sfall_archive ddraw.dll
mv ddraw.dll $release_dir/
rm -f $sfall_archive

# pack .dat
dat="${mod_name}.dat"
find . -type f | sed -e 's|^\.\/||' -e 's|\/|\\|g' | sort > "$file_list"
$dat2a "$mods_dir/$dat" @"$file_list"

cd $release_dir

zip -r "$zip" *
mv "$zip" ..
