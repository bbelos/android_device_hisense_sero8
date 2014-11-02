#
# Copyright (C) 2014 The CyanogenMod Project
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

LOCAL_PATH := device/hisense/sero8

TARGET_BOARD_PLATFORM := rk30xx
TARGET_BOARD_PLATFORM_GPU := mali400
TARGET_BOARD_HARDWARE := rk30board
TARGET_NO_BOOTLOADER := true
TARGET_CPU_VARIANT := cortex-a9


TARGET_BOARD_INFO_FILE := $(LOCAL_PATH)/board-info.txt

TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel

BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/custombootimg.mk

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi

# Enable NEON feature
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

USE_OPENGL_RENDERER := true

# rk30sdk uses Cortex A9
TARGET_EXTRA_CFLAGS += $(call cc-option,-mtune=cortex-a9,$(call cc-option,-mtune=cortex-a8)) $(call cc-option,-mcpu=cortex-a9,$(call cc-option,-mcpu=cortex-a8))

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648
BOARD_KERNELIMAGE_PARTITION_SIZE := 16777216
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_USERIMAGES_USE_EXT4 := true

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/root/fstab.rk30board
RECOVERY_FSTAB_VERSION := 2

TARGET_RELEASETOOLS_EXTENSIONS := device/hisense/sero8/releasetools

# Assert
TARGET_OTA_ASSERT_DEVICE := rk3188
