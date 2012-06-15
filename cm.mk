#
# Copyright (C) 2011 The Android Open-Source Project
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
$(call inherit-product, device/allwinner/novo7a/full_novo7a.mk)
# Inherit some common CM9 stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)
# 3G modems
$(call inherit-product, vendor/cm/config/gsm.mk)
# N7A prebuilt
$(call inherit-product, device/allwinner/novo7a/novo7a-blobs.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_novo7a
PRODUCT_BRAND := softwinners
PRODUCT_DEVICE := novo7a
PRODUCT_MODEL := NetTAB SKY
PRODUCT_MANUFACTURER := IconBIT
PRODUCT_RELEASE_NAME := A10

UTC_DATE := $(shell date +%s)
DATE     := $(shell date +%Y%m%d)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=crane_Novo704FC_A1_RU_SC3007 \
    BUILD_DISPLAY_ID=IML74K \
    BUILD_FINGERPRINT=softwinners/crane_Novo704FC_A1_RU_SC3007/crane-Novo704FC_A1_RU-SC3007:4.0.3/IML74K/20120428:eng/test-keys \
    PRIVATE_BUILD_DESC="crane_Novo704FC_A1_RU_SC3007-eng 4.0.3 IML74K 20120428 test-keys" \
    BUILD_NUMBER=${DATE} \
    BUILD_VERSION_TAGS=test-keys \
    TARGET_DEVICE=novo7a \
    TARGET_BUILD_TYPE=eng
