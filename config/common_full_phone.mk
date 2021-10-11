# Inherit full common Havoc stuff
$(call inherit-product, vendor/havoc/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Havoc LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/havoc/overlay/dictionaries

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode=true

$(call inherit-product, vendor/havoc/config/telephony.mk)
