# Apps
PRODUCT_PACKAGES += \
    ShadyQuickStepAppLockOverlay

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
    IconPackCircularPixelLauncherOverlay \
    IconPackCircularPixelThemePickerOverlay \
    IconPackFilledPixelLauncherOverlay \
    IconPackFilledPixelThemePickerOverlay \
    IconPackKaiPixelLauncherOverlay \
    IconPackKaiPixelThemePickerOverlay \
    IconPackRoundedPixelLauncherOverlay \
    IconPackRoundedPixelThemePickerOverlay \
    IconPackSamPixelLauncherOverlay \
    IconPackSamPixelThemePickerOverlay \
    IconPackVictorPixelLauncherOverlay \
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
