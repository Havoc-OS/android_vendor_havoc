# Inherit full common Havoc stuff
$(call inherit-product, vendor/havoc/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include havoc LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/havoc/overlay/dictionaries
