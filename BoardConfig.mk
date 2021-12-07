#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2021 TeamWin Recovery Project
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

# Allow building with minimal manifest

ALLOW_MISSING_DEPENDENCIES := true

DEVICE_PATH := device/ulefone/Armor_8_Pro

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := Gotron-GQ3090RH5
#TARGET_BOOTLOADER_BOARD_NAME := mt6771
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := mt6771
PRODUCT_PLATFORM := mt6771

# Assert
TARGET_OTA_ASSERT_DEVICE := Armor_8_Pro,Armor 8 Pro

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
#BOARD_KERNEL_CMDLINE += androidboot.force_normal_boot=1
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x14f88000
BOARD_KERNEL_TAGS_OFFSET := 0x13f88000
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz

TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img

#TARGET_KERNEL_SOURCE := kernel/
#TARGET_KERNEL_CONFIG := 

BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_BOOTIMG_HEADER_VERSION := 2

BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_VBMETA_SYSTEM := system product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1
BOARD_AVB_VBMETA_VENDOR := vendor
BOARD_AVB_VBMETA_VENDOR_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_VENDOR_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX_LOCATION := 2
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 3

# System as root
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false

# AB
AB_OTA_UPDATER := true

# Partitions configs
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true
TW_HAS_NO_RECOVERY_PARTITION := true

BOARD_USES_METADATA_PARTITION := true

# Partitions size
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432

# Dynamic Partitions
BOARD_SUPER_PARTITION_SIZE := 6442450944
BOARD_SUPER_PARTITION_GROUPS := main

BOARD_MAIN_PARTITION_LIST := system vendor product
BOARD_MAIN_SIZE := 6442450944

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
#BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
#BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
#BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_F2FS := true


# Workaround for copying error vendor files to recovery ramdisk
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_SYSTEM_EXT = system_ext

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/twrp.fstab

# Partitions (listed in the file) to be wiped under recovery.
TARGET_RECOVERY_WIPE := $(DEVICE_PATH)/recovery.wipe

# Additional binaries & libraries needed for recovery
TARGET_RECOVERY_DEVICE_MODULES += \
    libkeymaster4 \
    libpuresoftkeymasterdevice

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

## TWRP-Specific configuration

TW_THEME := portrait_hdpi
TW_DEFAULT_DEVICE_NAME := Armor_8_Pro
TW_DEVICE_VERSION := Ulefone Armor 8 Pro_20210705_V01 by lopestom
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_HAS_MTP := true
TW_EXCLUDE_TWRPAPP := true
TW_INCLUDE_REPACKTOOLS := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TARGET_USES_MKE2FS := true

# Device config
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1200
TW_SCREEN_BLANK_ON_BOOT := true

TW_EXCLUDE_DEFAULT_USB_INIT := true
RECOVERY_SDCARD_ON_DATA := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true

TW_Y_OFFSET := 86
TW_H_OFFSET := -86

# Decryption
TW_INCLUDE_CRYPTO := true
TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so
TW_INCLUDE_FBE_METADATA_DECRYPT := true
