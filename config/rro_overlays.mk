# Apps
PRODUCT_PACKAGES += \
    ShadyQuickStepAOSPOverlay \
    UpdaterOverlay

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

# Dark theme Overlays
PRODUCT_PACKAGES += \
    SystemRavenBlackOverlay \
    SystemUIRavenBlackOverlay \
    SystemDarkGrayOverlay \
    SystemUIDarkGrayOverlay \
    SystemStyleOverlay \
    SystemUIStyleOverlay \
    SystemNightOverlay \
    SystemUINightOverlay \
    SystemSolarizedDarkOverlay \
    SystemUISolarizedDarkOverlay \
    SystemMaterialOceanOverlay \
    SystemUIMaterialOceanOverlay \
    SystemBakedGreenOverlay \
    SystemUIBakedGreenOverlay \
    SystemChocoXOverlay \
    SystemUIChocoXOverlay \
    SystemDarkAubergineOverlay \
    SystemUIDarkAubergineOverlay \
    SystemClearSpringOverlay \
    SystemUIClearSpringOverlay

# Cutout Control
PRODUCT_PACKAGES += \
    HideCutout \
    StatusBarStock
