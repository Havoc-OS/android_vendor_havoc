# GApps
$(call inherit-product, vendor/gapps/config.mk)

# Overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/havoc/overlay-pixel
DEVICE_PACKAGE_OVERLAYS += vendor/havoc/overlay-pixel/common

# RRO Overlays
PRODUCT_PACKAGES += \
    PixelSetupWizardAodOverlay
