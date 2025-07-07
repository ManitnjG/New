#!/bin/bash
# ReVanced Experiments  build 
source src/build/utils.sh

#################################################

# Download requirements
dl_gh "ReVancedExperiments" "Aunali321" "latest"
dl_gh "revanced-cli" "revanced" "latest"

#################################################


# Patch Instagram:
get_patches_key "instagram-revanced-experiments"
wget "https://eb5e7388c3df147b74dd2379b7cf8323.r2.cloudflarestorage.com/downloadprod/wp-content/uploads/2025/06/86/685baaaa7dd50/com.instagram.android_386.0.0.12.84-379005219_minAPI28%28arm64-v8a%29%28nodpi%29_apkmirror.com.apk?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=72a5ba3a0b8a601e535d5525f12f8177%2F20250707%2Fauto%2Fs3%2Faws4_request&X-Amz-Date=20250707T100045Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Signature=7c978569f03828223397c35c62281fcd7e4d734456ecf475e5c28d70cada9939"
ls
mv *.apk* instagram-arm64-v8a.apk
patch "instagram-arm64-v8a" "revanced-experiments"
revanced_dl(){
	dl_gh "revanced-patches revanced-cli" "revanced" "latest"
# Patch Spotjfy Arm64-v8a
	get_patches_key "Spotjfy-revanced"
	j="i"
	get_apkpure "com.spot"$j"fy.music" "spotjfy-arm64-v8a" "spot"$j"fy-music-and-podcasts-for-android/com.spot"$j"fy.music" "Bundle"
	patch "spotjfy-arm64-v8a" "revanced"
}
