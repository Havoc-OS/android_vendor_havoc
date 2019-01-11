# World APN list
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# World SPN overrides list
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/etc/spn-conf.xml:system/etc/spn-conf.xml

# Selective SPN list for operator number who has the problem.
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/etc/selective-spn-conf.xml:system/etc/selective-spn-conf.xml

# Sensitive Phone Numbers list
PRODUCT_COPY_FILES += \
    vendor/havoc/prebuilt/common/etc/sensitive_pn.xml:system/etc/sensitive_pn.xml

# Telephony packages
PRODUCT_PACKAGES += \
    messaging \
    Stk \
    CellBroadcastReceiver

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext
