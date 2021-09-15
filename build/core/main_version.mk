# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# Havoc-OS System Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.havoc.build.date=$(HAVOC_BUILD_DATE) \
    ro.havoc.build.variant=$(HAVOC_BUILD_VARIANT) \
    ro.havoc.build.version=$(HAVOC_BUILD_VERSION) \
    ro.havoc.fingerprint=$(HAVOC_FINGERPRINT) \
    ro.havoc.group.url=$(HAVOC_GROUP_URL) \
    ro.havoc.maintainer.firstname=$(HAVOC_MAINTAINER_FIRSTNAME) \
    ro.havoc.maintainer.lastname=$(HAVOC_MAINTAINER_LASTNAME) \
    ro.havoc.maintainer.username=$(HAVOC_MAINTAINER_USERNAME) \
    ro.havoc.releasetype=$(HAVOC_BUILD_TYPE) \
    ro.havoc.version=$(HAVOC_VERSION)
