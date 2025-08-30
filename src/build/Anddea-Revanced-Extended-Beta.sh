#!/bin/bash
# Revanced Extended forked by Anddea build
source src/build/utils.sh
# Download requirements
dl_gh "revanced-patches" "ManitnjG" "prerelease"
dl_gh "revanced-cli" "inotia00" "latest"

# Patch YouTube:
get_patches_key "youtube-rve-anddea"
version="20.33.40"
get_apk "com.google.android.youtube" \
        "youtube-stable" \
        "youtube" \
        "google-inc/youtube/youtube" \
        "Bundle_extract"
split_editor "youtube-stable" "youtube-stable"
patch "youtube-stable" "anddea" "inotia"
