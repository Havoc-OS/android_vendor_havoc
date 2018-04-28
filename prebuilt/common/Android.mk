LOCAL_PATH := $(call my-dir)

# Prebuilt APKs included in Havoc builds

include $(CLEAR_VARS)
LOCAL_MODULE := LeanLauncher
LOCAL_MODULE_OWNER := havoc
LOCAL_SRC_FILES := app/$(LOCAL_MODULE).apk
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .apk
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := PRESIGNED
include $(BUILD_PREBUILT)
