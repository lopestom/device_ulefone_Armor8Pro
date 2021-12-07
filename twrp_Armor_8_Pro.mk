#
# Copyright (C) 2021 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit Armor_8_Pro rosemary device
$(call inherit-product, device/ulefone/Armor_8_Pro/device.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := Armor_8_Pro
PRODUCT_NAME := twrp_Armor_8_Pro
PRODUCT_BRAND := Ulefone
PRODUCT_MODEL := Armor 8 Pro
PRODUCT_MANUFACTURER := Ulefone
PRODUCT_RELEASE_NAME := Ulefone Armor 8 Pro
# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=Armor_8_Pro \
    PRODUCT_NAME=Armor_8_Pro_8GB \
    PRIVATE_BUILD_DESC="full_k71v1_64_bsp-user 11 RP1A.200720.011 1623742272 release-keys"

BUILD_FINGERPRINT := Ulefone/Armor_8_Pro_8GB/Armor_8_Pro:11/RP1A.200720.011/1623742272:user/release-keys

