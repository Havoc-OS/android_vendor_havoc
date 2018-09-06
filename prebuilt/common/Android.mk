LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := Calculator
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := app/$(LOCAL_MODULE).apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := .apk
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := Lawnchair
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := priv-app/$(LOCAL_MODULE).apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_PRIVILEGED_MODULE := true
LOCAL_OVERRIDES_PACKAGES := Home Launcher2 Launcher3 Launcher3QuickStep
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := .apk
LOCAL_DEX_PREOPT := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := SoundPickerPrebuilt
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := app/$(LOCAL_MODULE).apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := .apk
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := Via
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := app/$(LOCAL_MODULE).apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := .apk
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := WallpaperPickerGooglePrebuilt
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := priv-app/$(LOCAL_MODULE).apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_PRIVILEGED_MODULE := true
LOCAL_OVERRIDES_PACKAGES := WallpaperPicker WallpaperCropper
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := .apk
include $(BUILD_PREBUILT)

################################
# Copies the APN list file into system/etc for the product as apns-conf.xml.
# In the case where $(CUSTOM_APNS_FILE) is defined, the content of $(CUSTOM_APNS_FILE)
# is added or replaced to the $(DEFAULT_APNS_FILE).
include $(CLEAR_VARS)

LOCAL_MODULE := apns-conf.xml
LOCAL_MODULE_CLASS := ETC

DEFAULT_APNS_FILE := vendor/havoc/prebuilt/common/etc/apns-conf.xml

ifdef CUSTOM_APNS_FILE
CUSTOM_APNS_SCRIPT := vendor/havoc/tools/custom_apns.py
FINAL_APNS_FILE := $(local-generated-sources-dir)/apns-conf.xml

$(FINAL_APNS_FILE): PRIVATE_SCRIPT := $(CUSTOM_APNS_SCRIPT)
$(FINAL_APNS_FILE): PRIVATE_CUSTOM_APNS_FILE := $(CUSTOM_APNS_FILE)
$(FINAL_APNS_FILE): $(CUSTOM_APNS_SCRIPT) $(DEFAULT_APNS_FILE)
	rm -f $@
	python $(PRIVATE_SCRIPT) $@ $(PRIVATE_CUSTOM_APNS_FILE)
else
FINAL_APNS_FILE := $(DEFAULT_APNS_FILE)
endif

LOCAL_PREBUILT_MODULE_FILE := $(FINAL_APNS_FILE)

include $(BUILD_PREBUILT)
