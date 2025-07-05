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
wget "https://dw.uptodown.net/dwn/RvVkii134Riphftvun7hQBZyU0aCwJjJMFI3FD3XyiS2lMRqLHnjoYVPOf9Zv6sqh9hWBh1e-BijEGTweThzhcmGIU__puRCPMm0O7uQG6VeEbPYkbuIuZY9tiaRt_ge/U3rjlKgKci5ogZPSMyOd3bSK73JbNgkVyVFEIZnShStU9SHVUfcDMJaeWS844KfESrkg88L3BUHnHW_xPMfSUsRZpfnKnIcUI9vO3rdMLChdgxvx4_qvszitOKDQBteW/s4AS_Ec1brMMvP9j-Hz0MotwnkpDNdoALKentC8QLvksQM1PhQPM0ORKFB7YZNN_h89Y6w9gA1CGiZYFYdZUHTI1JHW47Lwo651cd3cFp2s=/uptodown-com.instagram.android.apk"
patch "instagram-arm64-v8a" "revanced-experiments"
revanced_dl(){
	dl_gh "revanced-patches revanced-cli" "revanced" "latest"
# Patch Spotjfy Arm64-v8a
	get_patches_key "Spotjfy-revanced"
	j="i"
	get_apkpure "com.spot"$j"fy.music" "spotjfy-arm64-v8a" "spot"$j"fy-music-and-podcasts-for-android/com.spot"$j"fy.music" "Bundle"
	patch "spotjfy-arm64-v8a" "revanced"
}
