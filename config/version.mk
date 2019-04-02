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
HAVOC_BASE_VERSION = 2.4
HAVOC_BUILD_VERSION := Havoc-OS-v$(HAVOC_BASE_VERSION)-$(DATE)-$(HAVOC_BUILD_TYPE)
HAVOC_DATE := $(shell date -u +%d-%m-%Y)
HAVOC_VERSION := Havoc-OS-v$(HAVOC_BASE_VERSION)-$(DATE)-$(HAVOC_BUILD)-$(HAVOC_BUILD_TYPE)
ROM_FINGERPRINT := Havoc-OS/v$(HAVOC_BASE_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(DATE)

export HAVOC_BASE_VERSION
export HAVOC_BUILD_VERSION
export HAVOC_BUILD_TYPE
export HAVOC_DATE
export HAVOC_VERSION
export ROM_FINGERPRINT
