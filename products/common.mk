# Generic product
PRODUCT_NAME := havoc
PRODUCT_BRAND := havoc
PRODUCT_DEVICE := generic

EXCLUDE_SYSTEMUI_TESTS := true

PRODUCT_BUILD_PROP_OVERRIDES := BUILD_DISPLAY_ID=$(TARGET_PRODUCT)-$(PLATFORM_VERSION)-$(BUILD_ID)

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.setupwizard.network_required=false \
    ro.setupwizard.gservices_delay=-1 \
    ro.com.android.dataroaming=false \
    drm.service.enabled=true \
    net.tethering.noprovisioning=true \
    persist.sys.dun.override=0 \
    ro.build.selinux=1 \
    ro.adb.secure=0 \
    ro.setupwizard.rotation_locked=true \
    ro.opa.eligible_device=true \
    persist.sys.disable_rescue=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.havoc.version=$(PLATFORM_VERSION)-$(BUILD_ID)

# Disable HDCP check
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.wfd.nohdcp=1

PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
    ro.adb.secure=0 \
    ro.secure=0 \
    persist.service.adb.enable=1

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/havoc/overlay/common

# Fix Dialer
PRODUCT_COPY_FILES +=  \
    vendor/havoc/prebuilt/common/etc/sysconfig/dialer_experience.xml:system/etc/sysconfig/dialer_experience.xml

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Bootanimation
ifneq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))
# determine the smaller dimension
TARGET_BOOTANIMATION_SIZE := $(shell \
  if [ "$(TARGET_SCREEN_WIDTH)" -lt "$(TARGET_SCREEN_HEIGHT)" ]; then \
    echo $(TARGET_SCREEN_WIDTH); \
  else \
    echo $(TARGET_SCREEN_HEIGHT); \
  fi )

# get a sorted list of the sizes
bootanimation_sizes := $(subst .zip,,$(shell ls -1 vendor/havoc/prebuilt/common/bootanimation | sort -rn))

# find the appropriate size and set
define check_and_set_bootanimation
$(eval TARGET_BOOTANIMATION_NAME := $(shell \
  if [ -z "$(TARGET_BOOTANIMATION_NAME)" ]; then \
    if [ "$(1)" -le "$(TARGET_BOOTANIMATION_SIZE)" ]; then \
      echo $(1); \
      exit 0; \
    fi;
  fi;
  echo $(TARGET_BOOTANIMATION_NAME); ))
endef
$(foreach size,$(bootanimation_sizes), $(call check_and_set_bootanimation,$(size)))

PRODUCT_COPY_FILES += vendor/havoc/prebuilt/common/bootanimation/$(TARGET_BOOTANIMATION_NAME).zip:system/media/bootanimation.zip
endif

# APN
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# Extra packages
PRODUCT_PACKAGES += \
    LeanLauncher \
    OmniJaws \
    Stk \
    Terminal

# Init.d script support
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/havoc/prebuilt/common/init.d/00banner:system/etc/init.d/00banner \
    vendor/havoc/prebuilt/common/init.d/init.d.rc:root/init.d.rc

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/addon.d/50-havoc.sh:system/addon.d/50-havoc.sh \
    vendor/havoc/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/havoc/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions

PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/bin/clean_cache.sh:system/bin/clean_cache.sh

# DU Utils Library
PRODUCT_BOOT_JARS += \
    org.dirtyunicorns.utils

# DU Utils Library
PRODUCT_PACKAGES += \
    org.dirtyunicorns.utils
# Themes
$(call inherit-product-if-exists, vendor/havoc/products/themes.mk)