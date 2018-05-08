# Charger
ifeq ($(WITH_HAVOC_CHARGER),true)
    BOARD_HAL_STATIC_LIBRARIES := libhealthd.havoc
endif

# QCOM HW crypto
ifeq ($(TARGET_HW_DISK_ENCRYPTION),true)
    TARGET_CRYPTFS_HW_PATH ?= vendor/qcom/opensource/cryptfs_hw
endif
