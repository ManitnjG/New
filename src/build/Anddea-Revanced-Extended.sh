#!/bin/bash
# Revanced Extended forked by Anddea build
source src/build/utils.sh
# Download requirements
dl_gh "revanced-patches" "anddea" "latest"
dl_gh "revanced-cli" "inotia00" "latest"

# Patch YouTube:
#get_patches_key "youtube-rve-anddea"
#get_apk "com.google.android.youtube" "youtube-stable" "youtube" "google-inc/youtube/youtube" "Bundle_extract"
#split_editor "youtube-stable" "youtube-stable"
#patch "youtube-stable" "anddea" "inotia"
# Patch Youtube Arm64-v8a
#get_patches_key "youtube-rve-anddea"
#split_editor "youtube-stable" "youtube-stable-arm64-v8a" "exclude" "split_config.armeabi_v7a split_config.x86 split_config.x86_64"
#patch "youtube-stable-arm64-v8a" "anddea" "inotia"
# Patch Youtube Armeabi-v7a
#get_patches_key "youtube-rve-anddea"
#split_editor "youtube-stable" "youtube-stable-armeabi-v7a" "exclude" "split_config.arm64_v8a split_config.x86 split_config.x86_64"
#patch "youtube-stable-armeabi-v7a" "anddea" "inotia"
# Patch Youtube x86
#get_patches_key "youtube-rve-anddea"
#split_editor "youtube-stable" "youtube-stable-x86" "exclude" "split_config.arm64_v8a split_config.armeabi_v7a split_config.x86_64"
#patch "youtube-stable-x86" "anddea" "inotia"
# Patch Youtube x86_64
#get_patches_key "youtube-rve-anddea"
#split_editor "youtube-stable" "youtube-stable-x86_64" "exclude" "split_config.arm64_v8a split_config.armeabi_v7a split_config.x86"
#patch "youtube-stable-x86_64" "anddea" "inotia"
# Patch YouTube:
#get_patches_key "youtube-rve-anddea"
#get_apk "com.google.android.youtube" "youtube-stable" "youtube" "google-inc/youtube/youtube"
#patch "youtube-stable" "anddea" "inotia"
# Split architecture Youtube:
#get_patches_key "youtube-rve-anddea"
#for i in {0..3}; do
#  split_arch "youtube-stable" "anddea" "$(gen_rip_libs ${libs[i]})"
#done


# Patch Spotjfy Arm64-v8a
get_patches_key "Spotjfy-anddea"
j="i"
get_apkpure "com.spot"$j"fy.music" "spotjfy-arm64-v8a" "spot"$j"fy-music-and-podcasts-for-android/com.spot"$j"fy.music"
patch "spotjfy-arm64-v8a" "anddea"

