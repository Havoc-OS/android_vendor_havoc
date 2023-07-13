# Increase Havoc-OS Version with each major release.
HAVOC_VERSION := 6.0

HAVOC_BUILD_DATE := $(shell date -u +%Y%m%d)

# Build type
ifndef HAVOC_BUILD_TYPE
    HAVOC_BUILD_TYPE := Unofficial
endif

# Build variant
ifeq ($(WITH_GAPPS),false)
    HAVOC_BUILD_VARIANT = Vanilla
else
    HAVOC_BUILD_VARIANT = GApps
endif

# Internal version
LINEAGE_VERSION := Havoc-OS-v$(HAVOC_VERSION)-$(shell date +%Y%m%d)-$(LINEAGE_BUILD)-$(HAVOC_BUILD_TYPE)-$(HAVOC_BUILD_VARIANT)

# Display version
LINEAGE_DISPLAY_VERSION := Havoc-OS-v$(HAVOC_VERSION)-$(LINEAGE_BUILD)
