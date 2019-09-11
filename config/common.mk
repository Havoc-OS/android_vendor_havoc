# Allow vendor/extra to override any property by setting it first
$(call inherit-product-if-exists, vendor/extra/product.mk)

PRODUCT_BRAND ?= Havoc-OS

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.selinux=1

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

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/havoc/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/havoc/prebuilt/common/bin/50-havoc.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-havoc.sh \
    vendor/havoc/prebuilt/common/bin/blacklist:$(TARGET_COPY_OUT_SYSTEM)/addon.d/blacklist

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/bin/backuptool_ab.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.sh \
    vendor/havoc/prebuilt/common/bin/backuptool_ab.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.functions \
    vendor/havoc/prebuilt/common/bin/backuptool_postinstall.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_postinstall.sh
endif

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/havoc/config/permissions/backup.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/backup.xml

# Havoc-specific broadcast actions whitelist
PRODUCT_COPY_FILES += \
    vendor/havoc/config/permissions/havoc-sysconfig.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/havoc-sysconfig.xml

# init.d support
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/etc/init.d/00banner:$(TARGET_COPY_OUT_SYSTEM)/etc/init.d/00banner \
    vendor/havoc/prebuilt/common/bin/sysinit:$(TARGET_COPY_OUT_SYSTEM)/bin/sysinit

ifneq ($(TARGET_BUILD_VARIANT),user)
# userinit support
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/etc/init.d/90userinit:$(TARGET_COPY_OUT_SYSTEM)/etc/init.d/90userinit
endif

# Copy all Havoc-specific init rc files
$(foreach f,$(wildcard vendor/havoc/prebuilt/common/etc/init/*.rc),\
	$(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM)/etc/init/$(notdir $f)))

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/lib/content-types.properties:$(TARGET_COPY_OUT_SYSTEM)/lib/content-types.properties

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/Vendor_045e_Product_0719.kl

# This is Havoc!
PRODUCT_COPY_FILES += \
    vendor/havoc/config/permissions/privapp-permissions-havoc-system.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-havoc.xml \
    vendor/havoc/config/permissions/privapp-permissions-havoc-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-havoc.xml

# Hidden API whitelist
PRODUCT_COPY_FILES += \
    vendor/havoc/config/permissions/havoc-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/havoc-hiddenapi-package-whitelist.xml

# Power whitelist
PRODUCT_COPY_FILES += \
    vendor/havoc/config/permissions/havoc-power-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/havoc-power-whitelist.xml

# Include Google fonts
include vendor/havoc/config/fonts.mk

# TWRP
ifeq ($(WITH_TWRP),true)
include vendor/havoc/config/twrp.mk
endif

# Do not include art debug targets
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Disable vendor restrictions
PRODUCT_RESTRICT_VENDOR_FILES := false

# Bootanimation
PRODUCT_PACKAGES += \
    bootanimation.zip

# AOSP packages
PRODUCT_PACKAGES += \
    ExactCalculator \
    Exchange2 \
    Terminal \
    ThemePicker

# Havoc packages
PRODUCT_PACKAGES += \
    Browser \
    GalleryGoPrebuilt \
    NexusLauncherRelease \
    SettingsIntelligenceGooglePrebuilt

# Overlays
PRODUCT_PACKAGES += \
    NexusLauncherReleaseOverlay

# Accents
PRODUCT_PACKAGES += \
    AccentColorYellowOverlay \
    AccentColorVioletOverlay \
    AccentColorTealOverlay \
    AccentColorRedOverlay \
    AccentColorQGreenOverlay \
    AccentColorPinkOverlay \
    AccentColorLightPurpleOverlay \
    AccentColorIndigoOverlay \
    AccentColorFlatPinkOverlay \
    AccentColorCyanOverlay \
    AccentColorBlueGrayOverlay

# Extra tools in Havoc
PRODUCT_PACKAGES += \
    7z \
    awk \
    bash \
    bzip2 \
    curl \
    getcap \
    htop \
    lib7z \
    libsepol \
    pigz \
    powertop \
    setcap \
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

# Storage manager
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.storage_manager.enabled=true

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# These packages are excluded from user builds
PRODUCT_PACKAGES_DEBUG += \
    micro_bench \
    procmem \
    procrank \
    strace

# Conditionally build in su
ifneq ($(TARGET_BUILD_VARIANT),user)
ifeq ($(WITH_SU),true)
PRODUCT_PACKAGES += \
    su
endif
endif

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/havoc/overlay
DEVICE_PACKAGE_OVERLAYS += vendor/havoc/overlay/common

# Enable ccache
USE_CCACHE := true

-include $(WORKSPACE)/build_env/image-auto-bits.mk
-include vendor/havoc/config/partner_gms.mk
-include vendor/havoc/config/version.mk
