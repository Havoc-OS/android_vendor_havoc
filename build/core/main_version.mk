# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# Havoc-OS System Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.havoc.build.date=$(HAVOC_BUILD_DATE) \
    ro.havoc.build.version=$(LINEAGE_VERSION) \
    ro.havoc.display.version=$(LINEAGE_DISPLAY_VERSION) \
    ro.havoc.version=$(HAVOC_VERSION) \
    ro.havoclegal.url=https://havoc-os.com/privacy

# LineageOS Platform SDK Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.lineage.build.version.plat.sdk=$(LINEAGE_PLATFORM_SDK_VERSION)

# LineageOS Platform Internal Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.lineage.build.version.plat.rev=$(LINEAGE_PLATFORM_REV)
