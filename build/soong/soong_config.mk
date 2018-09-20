# Insert new variables inside the Havoc structure
havoc_soong:
	$(hide) mkdir -p $(dir $@)
	$(hide) (\
	echo '{'; \
	echo '"Havoc": {'; \
	echo '    "Has_legacy_camera_hal1": $(if $(filter true,$(TARGET_HAS_LEGACY_CAMERA_HAL1)),true,false),'; \
	echo '    "Needs_legacy_camera_hal1_dyn_native_handle": $(if $(filter true,$(TARGET_NEEDS_LEGACY_CAMERA_HAL1_DYN_NATIVE_HANDLE)),true,false),'; \
	echo '    "Needs_text_relocations": $(if $(filter true,$(TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS)),true,false),'; \
	echo '    "Specific_camera_parameter_library": "$(TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY)",'; \
	echo '    "Target_shim_libs": "$(subst $(space),:,$(TARGET_LD_SHIM_LIBS))",'; \
	echo '    "Uses_generic_camera_parameter_library": $(if $(TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY),false,true),'; \
	echo '    "Uses_nvidia_enhancements": $(if $(filter TRUE,$(NV_ANDROID_FRAMEWORK_ENHANCEMENTS)),true,false),'; \
	echo '    "Uses_qcom_bsp_legacy": $(if $(filter true,$(TARGET_USES_QCOM_BSP_LEGACY)),true,false),'; \
	echo '    "Uses_qti_camera_device": $(if $(filter true,$(TARGET_USES_QTI_CAMERA_DEVICE)),true,false)'; \
	echo '},'; \
	echo '') > $(SOONG_VARIABLES_TMP)

_contents := $(_contents)    "Lineage":{$(newline)

# See build/core/soong_config.mk for the add_json_* functions you can use here.
$(call add_json_str_omitempty, Additional_gralloc_10_usage_bits, $(TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS))
$(call add_json_bool, Has_legacy_camera_hal1, $(filter true,$(TARGET_HAS_LEGACY_CAMERA_HAL1)))
$(call add_json_str, Java_Source_Overlays, $(JAVA_SOURCE_OVERLAYS))
$(call add_json_bool, Needs_text_relocations, $(filter true,$(TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS)))
$(call add_json_str, Specific_camera_parameter_library, $(TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY))
$(call add_json_str_omitempty, Target_process_sdk_version_override, $(TARGET_PROCESS_SDK_VERSION_OVERRIDE))
$(call add_json_str_omitempty, Target_shim_libs, $(TARGET_LD_SHIM_LIBS))
$(call add_json_bool, Uses_generic_camera_parameter_library, $(if $(TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY),,true))
$(call add_json_bool, Uses_nvidia_enhancements, $(filter TRUE,$(NV_ANDROID_FRAMEWORK_ENHANCEMENTS)))
$(call add_json_bool, Uses_qcom_bsp_legacy, $(filter true,$(TARGET_USES_QCOM_BSP_LEGACY)))
$(call add_json_bool, Uses_qti_camera_device, $(filter true,$(TARGET_USES_QTI_CAMERA_DEVICE)))

# This causes the build system to strip out the last comma in our nested struct, to keep the JSON valid.
_contents := $(_contents)__SV_END

_contents := $(_contents)    },$(newline)
