PRODUCT_BRAND ?= Havoc-OS

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

EXCLUDE_SYSTEMUI_TESTS := true

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
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0 \
    ro.build.selinux=1 \
    ro.setupwizard.rotation_locked=true \
    ro.opa.eligible_device=true \
    persist.sys.disable_rescue=true

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.dun.override=0
endif

ifeq ($(TARGET_BUILD_VARIANT),eng)
# Disable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=0
else
# Enable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

ifeq ($(BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE),)
  PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.device.cache_dir=/data/cache
else
  PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.device.cache_dir=/cache
endif

# Whitelist packages for location providers not in system
PRODUCT_PROPERTY_OVERRIDES += \
    ro.services.whitelist.packagelist=com.google.android.gms

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/havoc/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/havoc/prebuilt/common/bin/50-havoc.sh:system/addon.d/50-havoc.sh

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/havoc/prebuilt/common/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/havoc/prebuilt/common/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/havoc/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# init.d support
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner

# Copy all Havoc-specific init rc files
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/etc/init.local.rc:root/init.havoc.rc

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Sensitive Phone Numbers list
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/etc/sensitive_pn.xml:system/etc/sensitive_pn.xml

# World APN list
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# Fix Google dialer
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/etc/dialer_experience.xml:system/etc/sysconfig/dialer_experience.xml

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# Latin IME lib
ifeq ($(TARGET_ARCH),arm64)
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so \
    vendor/havoc/prebuilt/common/lib64/libjni_latinimegoogle.so:system/lib64/libjni_latinimegoogle.so
else
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so
endif

# Havoc Packages
PRODUCT_PACKAGES += \
    PixelLauncher \
    SoundPickerPrebuilt \
    Turbo

# Permissions
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/etc/permissions/privapp-permissions-turbo.xml:system/etc/permissions/privapp-permissions-turbo.xml

# Sysconfig
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/etc/sysconfig/google-hiddenapi-package-whitelist.xml:system/etc/sysconfig/google-hiddenapi-package-whitelist.xml \
    vendor/havoc/prebuilt/common/etc/sysconfig/pixel.xml:system/etc/sysconfig/pixel.xml \
    vendor/havoc/prebuilt/common/etc/sysconfig/turbo.xml:system/etc/sysconfig/turbo.xml

# Exchange support
PRODUCT_PACKAGES += \
    Exchange2

# Extra tools in Havoc
PRODUCT_PACKAGES += \
    7z \
    awk \
    bash \
    bzip2 \
    curl \
    htop \
    lib7z \
    libsepol \
    pigz \
    powertop \
    unrar \
    unzip \
    vim \
    wget \
    zip

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Custom off-mode charger
ifeq ($(WITH_HAVOC_CHARGER),true)
PRODUCT_PACKAGES += \
    havoc_charger_res_images \
    font_log.png \
    libhealthd.havoc
endif

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.exfat \
    fsck.ntfs \
    mke2fs \
    mkfs.exfat \
    mkfs.ntfs \
    mount.ntfs

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

# Set Pixel blue light theme on Gboard
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.ime.theme_id=5

# Storage manager
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.storage_manager.enabled=true

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# Disable rescue party
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.disable_rescue=true

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/havoc/overlay
DEVICE_PACKAGE_OVERLAYS += vendor/havoc/overlay/common

# Bootanimation
include vendor/havoc/config/bootanimation.mk

# Version
include vendor/havoc/config/version.mk
