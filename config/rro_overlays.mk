# Apps
PRODUCT_PACKAGES += \
    ShadyQuickStepAOSPOverlay

# Accents
PRODUCT_PACKAGES += \
    AccentColorYellowOverlay \
    AccentColorVioletOverlay \
    AccentColorTealOverlay \
    AccentColorRedOverlay \
    AccentColorQGreenOverlay \
    AccentColorPinkOverlay \
    AccentColorLightPurpleOverlay \
    AccentColorIndigoOverlay \
    AccentColorFlatPinkOverlay \
    AccentColorCyanOverlay \
    AccentColorBlueGrayOverlay \
    AccentColorMintOverlay \
    AccentColorAmberOverlay \
    AccentColorCandyRedOverlay \
    AccentColorDdayGreenOverlay \
    AccentColorFrenchBleuOverlay \
    AccentColorHeirloomBleuOverlay \
    AccentColorHolillusionOverlay \
    AccentColorIllusionsPurpleOverlay \
    AccentColorObfusBleuOverlay \
    AccentColorOnePlusRedOverlay \
    AccentColorSeasideMintOverlay \
    AccentColorWarmthOrangeOverlay

# Fonts
PRODUCT_PACKAGES += \
    FontArbutusSourceOverlay \
    FontArvoLatoOverlay \
    FontKaiOverlay \
    FontRubikRubikOverlay \
    FontSamOverlay \
    FontVictorOverlay

ifeq ($(WITH_GAPPS),true)
# Icon Packs
PRODUCT_PACKAGES += \
    IconPackCircularPixelThemePickerOverlay \
    IconPackFilledPixelThemePickerOverlay \
    IconPackKaiPixelThemePickerOverlay \
    IconPackRoundedPixelThemePickerOverlay \
    IconPackSamPixelThemePickerOverlay \
    IconPackVictorPixelThemePickerOverlay
endif

# Primary Colors
PRODUCT_PACKAGES += \
    PrimaryColorCharcoalOverlay \
    PrimaryColorFlameOverlay \
    PrimaryColorGrayOverlay \
    PrimaryColorNatureOverlay \
    PrimaryColorOceanOverlay

# Cutout Control
PRODUCT_PACKAGES += \
    HideCutout \
    StatusBarStock
