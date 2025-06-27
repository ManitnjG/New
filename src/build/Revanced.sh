#!/bin/bash
# Revanced build
source ./src/build/utils.sh
# Download requirements
revanced_dl() {
    dl_gh "revanced-patches revanced-cli" "revanced" "latest"
}

patch_apps() {
    revanced_dl

    # ---- Patch TikTok ----
    get_patches_key "tiktok"

    # Get TikTok APK from Uptodown
    base_url="https://tiktok.en.uptodown.com/android/download/1026195874-x"
    final_url="https://dw.uptodown.com/dwn/$(req "$base_url" - | $pup -p --charset utf-8 'button#detail-download-button attr{data-url}')"

    # Download TikTok APK
    req "$final_url" "tiktok.apk"

    # Patch TikTok
    patch "tiktok" "revanced"

    # ---- Patch Instagram ----
    get_patches_key "instagram"

    # Download Instagram APK (arm64-v8a)
    get_apk "com.instagram.android" \
            "instagram-arm64-v8a" \
            "instagram-instagram" \
            "instagram/instagram-instagram/instagram" \
            "arm64-v8a" \
            "nodpi"

    # Patch Instagram
    patch "instagram-arm64-v8a" "revanced"
}

# CLI handler
case "$1" in
    4)
        patch_apps
        ;;
    *)
        echo "Usage: $0 4"
        ;;
esac
