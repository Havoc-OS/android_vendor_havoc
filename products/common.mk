# Generic product
PRODUCT_NAME := havoc
PRODUCT_BRAND := havoc
PRODUCT_DEVICE := generic

HAVOC_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)

EXCLUDE_SYSTEMUI_TESTS := true

PRODUCT_BUILD_PROP_OVERRIDES := BUILD_DISPLAY_ID=$(TARGET_PRODUCT)-$(PLATFORM_VERSION)-$(BUILD_ID)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
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

# Default notification/alarm sounds
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.config.ringtone=The_big_adventure.ogg \
    ro.config.notification_sound=Ping.ogg \
    ro.config.alarm_alert=Spokes.ogg

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    org.havoc.fingerprint=$(PLATFORM_VERSION)-$(BUILD_ID)-$(HAVOC_BUILD_DATE)

PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
    ro.adb.secure=0 \
    ro.secure=0 \
    persist.service.adb.enable=1

# Common overlay
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/havoc/overlay/common
DEVICE_PACKAGE_OVERLAYS += vendor/havoc/overlay/common

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

# Latin IME lib - gesture typing
ifeq ($(TARGET_ARCH),arm64)
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/lib64/libjni_latinimegoogle.so:system/lib64/libjni_latinimegoogle.so \
    vendor/havoc/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so
else
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so
endif

# APN
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# Extra packages
PRODUCT_PACKAGES += \
    AdAway \
    Calculator \
    DeskClock \
    PixelLauncher \
    SoundPicker \
    Stk \
    Terminal \
    Turbo \
    WallpaperPickerGooglePrebuilt

# Fonts
PRODUCT_COPY_FILES += \
    vendor/havoc/fonts/GoogleSans-Regular.ttf:system/fonts/GoogleSans-Regular.ttf \
    vendor/havoc/fonts/GoogleSans-Medium.ttf:system/fonts/GoogleSans-Medium.ttf \
    vendor/havoc/fonts/GoogleSans-MediumItalic.ttf:system/fonts/GoogleSans-MediumItalic.ttf \
    vendor/havoc/fonts/GoogleSans-Italic.ttf:system/fonts/GoogleSans-Italic.ttf \
    vendor/havoc/fonts/GoogleSans-Bold.ttf:system/fonts/GoogleSans-Bold.ttf \
    vendor/havoc/fonts/GoogleSans-BoldItalic.ttf:system/fonts/GoogleSans-BoldItalic.ttf

# Set Pixel blue light theme on Gboard
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.ime.theme_id=5

# Permissions
PRODUCT_COPY_FILES += \
    vendor/havoc/etc/permissions/privapp-permissions-turbo.xml:system/etc/permissions/privapp-permissions-turbo.xml

# Sysconfig
PRODUCT_COPY_FILES += \
    vendor/havoc/etc/sysconfig/google-hiddenapi-package-whitelist.xml:system/etc/sysconfig/google-hiddenapi-package-whitelist.xml \
    vendor/havoc/etc/sysconfig/pixel.xml:system/etc/sysconfig/pixel.xml \
    vendor/havoc/etc/sysconfig/turbo.xml:system/etc/sysconfig/turbo.xml

# Init.d script support
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/havoc/prebuilt/common/etc/init/havoc-system.rc:system/etc/init/havoc-system.rc \
    vendor/havoc/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/addon.d/50-havoc.sh:system/addon.d/50-havoc.sh \
    vendor/havoc/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/havoc/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions

# Version
include vendor/havoc/config/version.mk
