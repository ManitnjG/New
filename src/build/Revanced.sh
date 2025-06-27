#!/bin/bash
# Revanced build
source ./src/build/utils.sh
# Download requirements
revanced_dl(){
	dl_gh "revanced-patches revanced-cli" "revanced" "latest"
}

4() {
	revanced_dl
	# Patch Tiktok:
	get_patches_key "tiktok"
	url="https://tiktok.en.uptodown.com/android/download/1026195874-x" #Use uptodown because apkmirror ban tiktok in US lead github action can't download apk file
	url="https://dw.uptodown.com/dwn/$(req "$url" - | $pup -p --charset utf-8 'button#detail-download-button attr{data-url}')"
	req "$url" "tiktok.apk"
	patch "tiktok" "revanced"
	# Patch Instagram:
	# Arm64-v8a
	get_patches_key "instagram"
	get_apk "com.instagram.android" "instagram-arm64-v8a" "instagram-instagram" "instagram/instagram-instagram/instagram" "arm64-v8a" "nodpi"
	patch "instagram-arm64-v8a" "revanced"
}

    4)
        4
        ;;
  
esac
