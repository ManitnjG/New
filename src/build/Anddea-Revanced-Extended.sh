#!/bin/bash
# Revanced Extended forked by Anddea build
source src/build/utils.sh
# Download requirements
dl_gh "revanced-patches" "anddea"
dl_gh "revanced-cli" "inotia00" "latest"
get_patches_key "Spotjfy-anddea"
j="i"
version="9.0.98.265"
get_apkpure "com.spot"$j"fy.music" "spotjfy-arm64-v8a" "spot"$j"fy-music-and-podcasts-for-android/com.spot"$j"fy.music"
patch "spotjfy-arm64-v8a" "anddea"

