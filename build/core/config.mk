#
# Copyright (C) 2012 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# We modify several neverallows, so let the build proceed
ifneq ($(TARGET_BUILD_VARIANT),user)
SELINUX_IGNORE_NEVERALLOWS := true
endif

# Rules for MTK targets
include $(TOPDIR)vendor/havoc/build/core/mtk_target.mk

# Rules for QCOM targets
include $(TOPDIR)vendor/havoc/build/core/qcom_target.mk

BUILD_RRO_SYSTEM_PACKAGE := $(TOP)/vendor/havoc/build/core/system_rro.mk
