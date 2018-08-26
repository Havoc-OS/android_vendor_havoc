# Versioning System
HAVOC_BASE_VERSION = v2.0

ifndef HAVOC_BUILD_TYPE
    HAVOC_BUILD_TYPE := Unofficial
endif

# Only include Havoc OTA for official builds
ifeq ($(filter-out Official,$(HAVOC_BUILD_TYPE)),)
    PRODUCT_PACKAGES += \
        HavocOTA
endif

# Set all versions
DATE := $(shell date -u +%Y%m%d)
HAVOC_VERSION := Havoc-OS-$(HAVOC_BASE_VERSION)-$(DATE)-$(TARGET_DEVICE)-$(HAVOC_BUILD_TYPE)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.havoc.version=$(HAVOC_VERSION) \
    ro.mod.version=$(HAVOC_BUILD_TYPE)-$(HAVOC_BASE_VERSION)-$(DATE)