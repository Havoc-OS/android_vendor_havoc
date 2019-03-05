# Versioning System

ifndef HAVOC_BUILD_TYPE
    HAVOC_BUILD_TYPE := Unofficial
endif

# Only include Havoc OTA for official builds
ifeq ($(filter-out Official,$(HAVOC_BUILD_TYPE)),)
    PRODUCT_PACKAGES += \
        Updater
endif

TARGET_PRODUCT_SHORT := $(subst havoc_,,$(HAVOC_BUILD_TYPE))

# Set all versions
DATE := $(shell date -u +%Y%m%d)
HAVOC_BASE_VERSION = 2.3
HAVOC_BUILD_VERSION := Havoc-OS-v$(HAVOC_BASE_VERSION)-$(DATE)-$(HAVOC_BUILD_TYPE)
HAVOC_DATE := $(shell date -u +%d-%m-%Y)
HAVOC_VERSION := Havoc-OS-v$(HAVOC_BASE_VERSION)-$(DATE)-$(HAVOC_BUILD)-$(HAVOC_BUILD_TYPE)
ROM_FINGERPRINT := Havoc-OS/v$(HAVOC_BASE_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(DATE)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.havoc.base.version=$(HAVOC_BASE_VERSION) \
    ro.havoc.build.date=$(HAVOC_DATE) \
    ro.havoc.build.version=$(HAVOC_BUILD_VERSION) \
    ro.havoc.fingerprint=$(ROM_FINGERPRINT) \
    ro.havoc.releasetype=$(HAVOC_BUILD_TYPE) \
    ro.havoc.version=$(HAVOC_VERSION)
