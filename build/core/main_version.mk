# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# Havoc-OS System Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.havoc.build.date=$(HAVOC_BUILD_DATE) \
    ro.havoc.build.variant=$(HAVOC_BUILD_VARIANT) \
    ro.havoc.build.version=$(HAVOC_BUILD_VERSION) \
    ro.havoc.fingerprint=$(HAVOC_FINGERPRINT) \
    ro.havoc.releasetype=$(HAVOC_BUILD_TYPE) \
    ro.havoc.version=$(HAVOC_VERSION)
