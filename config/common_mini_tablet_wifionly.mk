# Inherit mini common Havoc stuff
$(call inherit-product, vendor/havoc/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME
