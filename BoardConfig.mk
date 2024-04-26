#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 The TWRP Open Source Project
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

# Device path
DEVICE_PATH := device/tecno/Neo2

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53

# CPUSet
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Platform
TARGET_BOARD_PLATFORM := mt6768
BOARD_USES_MTK_HARDWARE := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := TECNO-LG6n
TARGET_NO_BOOTLOADER := true

# Assert
TARGET_OTA_ASSERT_DEVICE := TECNO-LG6n

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_BASE := 0x40078000
BOARD_RAMDISK_OFFSET := 0x07c08000
BOARD_KERNEL_SECOND_OFFSET := 0xbff88000
BOARD_KERNEL_TAGS_OFFSET := 0x0bc08000
BOARD_DTB_OFFSET := 0x0bc08000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_IMAGE_NAME := Image.gz
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_HASH_TYPE := sha1
BOARD_BOOT_HEADER_VERSION := 2
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE) --board "CY-LG6N-H6924"
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)

# File systems and partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Recovery
BOARD_USES_RECOVERY_AS_BOOT := true

# Workaround for error copying files to recovery ramdisk
TARGET_COPY_OUT_VENDOR := vendor

# Dynamic Partition
BOARD_SUPER_PARTITION_SIZE := 9656598528
BOARD_SUPER_PARTITION_GROUPS := main
BOARD_MAIN_SIZE := 9652404224 # (BOARD_SUPER_PARTITION_SIZE - 4MB)
BOARD_MAIN_PARTITION_LIST :=  system system_ext product vendor

# AVB - Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# Metadata
BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS += metadata tranfs

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# Crypto
TW_SKIP_ADDITIONAL_FSTAB := true
TW_PREPARE_DATA_MEDIA_EARLY := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_NO_FASTBOOT_BOOT := true

# Properties
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
TARGET_VENDOR_PROP := $(DEVICE_PATH)/vendor.prop

#keymaster
TW_FORCE_KEYMASTER_VER := true

# Resolution
TW_THEME := portrait_hdpi
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# TWRP Configuration
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/leds/lcd-backlight/brightness\"
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 1200
TW_DEFAULT_BRIGHTNESS := 900
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_EXTRA_LANGUAGES := false
TW_DEFAULT_LANGUAGE := en
TARGET_USES_MKE2FS := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.usb0/lun.%d/file
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_DEVICE_VERSION := BY GOKU FOR TECNO POVA NEO 2
TW_HAS_MTP := true
RECOVERY_SDCARD_ON_DATA := true

## TWRP-Specific configuration
TW_EXCLUDE_APEX := true
TW_EXCLUDE_PYTHON := true
TW_EXCLUDE_NANO := true
TW_EXCLUDE_TWRPAPP := true
TW_EXCLUDE_TZDATA := true
TW_EXCLUDE_BASH := true
TW_EXCLUDE_LPTOOLS := true
TW_EXCLUDE_LPDUMP := true

# resetprop and magiskboot
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_LIBRESETPROP :=true

# Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
