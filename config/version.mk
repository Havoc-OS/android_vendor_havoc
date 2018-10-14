# Versioning System
HAVOC_BASE_VERSION = v2.0

ifndef HAVOC_BUILD_TYPE
    HAVOC_BUILD_TYPE := Unofficial
endif

# Only include Havoc OTA for official builds
ifeq ($(filter-out Official,$(HAVOC_BUILD_TYPE)),)
    PRODUCT_PACKAGES += \
        Updates
endif

TARGET_PRODUCT_SHORT := $(subst havoc_,,$(HAVOC_BUILD_TYPE))

# Set all versions
DATE := $(shell date -u +%Y%m%d)
HAVOC_BUILD_VERSION := Havoc-OS-$(HAVOC_BASE_VERSION)-$(DATE)-$(HAVOC_BUILD_TYPE)
HAVOC_VERSION := Havoc-OS-$(HAVOC_BASE_VERSION)-$(DATE)-$(HAVOC_BUILD)-$(HAVOC_BUILD_TYPE)
ROM_FINGERPRINT := Havoc-OS/$(HAVOC_BASE_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(shell date +%Y%m%d)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.havoc.build.version=$(HAVOC_BUILD_VERSION) \
    ro.havoc.version=$(HAVOC_VERSION) \
    ro.havoc.releasetype=$(HAVOC_BUILD_TYPE) \
    ro.mod.version=$(HAVOC_BUILD_TYPE)-$(HAVOC_BASE_VERSION)-$(DATE) \
    ro.havoc.fingerprint=$(ROM_FINGERPRINT)
