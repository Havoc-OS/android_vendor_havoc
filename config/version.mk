# Increase Havoc-OS Version with each major release.
HAVOC_VERSION := 6.0

HAVOC_BUILD_DATE := $(shell date -u +%Y%m%d)

# Internal version
LINEAGE_VERSION := Havoc-OS-v$(HAVOC_VERSION)-$(shell date +%Y%m%d)-$(LINEAGE_BUILD)

# Display version
LINEAGE_DISPLAY_VERSION := Havoc-OS-v$(HAVOC_VERSION)-$(LINEAGE_BUILD)
