# Inherit full common Havoc stuff
$(call inherit-product, vendor/havoc/config/common_full.mk)

PRODUCT_PACKAGES += \
    AppDrawer \
    LineageCustomizer

DEVICE_PACKAGE_OVERLAYS += vendor/havoc/overlay/tv
