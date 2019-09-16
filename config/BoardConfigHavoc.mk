# Charger
ifeq ($(WITH_HAVOC_CHARGER),true)
    BOARD_HAL_STATIC_LIBRARIES := libhealthd.havoc
endif

include vendor/havoc/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/havoc/config/BoardConfigQcom.mk
endif

include vendor/havoc/config/BoardConfigSoong.mk
