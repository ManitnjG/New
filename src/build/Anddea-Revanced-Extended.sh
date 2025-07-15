#!/bin/bash
# Revanced Extended forked by Anddea build
source src/build/utils.sh
# Download requirements
dl_gh "revanced-patches" "anddea"
dl_gh "revanced-cli" "inotia00" "latest"
wget "https://objects.githubusercontent.com/github-production-release-asset-2e65be/541089033/07c6ce54-c828-4f28-b6f8-bcaa67794065?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20250715%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20250715T065949Z&X-Amz-Expires=1800&X-Amz-Signature=dcf1507b607845e9b588f188439031d0b70402eede5939f97dfec279f9b8ee12&X-Amz-SignedHeaders=host&response-content-disposition=attachment%3B%20filename%3Drevanced-cli-5.0.1-all.jar&response-content-type=application%2Foctet-stream"
get_patches_key "Spotjfy-anddea"
j="i"
get_apkpure "com.spot"$j"fy.music" "spotjfy-arm64-v8a" "spot"$j"fy-music-and-podcasts-for-android/com.spot"$j"fy.music"
patch "spotjfy-arm64-v8a" "anddea"

