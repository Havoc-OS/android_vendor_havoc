# Inherit common Havoc stuff
$(call inherit-product, vendor/havoc/config/common.mk)

PRODUCT_SIZE := full

# Recorder
PRODUCT_PACKAGES += \
    Recorder
