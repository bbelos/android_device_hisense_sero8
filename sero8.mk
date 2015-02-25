#
# Copyright (C) 2012 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

DEVICE_PACKAGE_OVERLAYS += device/hisense/sero8/overlay

LOCAL_PATH := device/hisense/sero8

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160

# Prebuilt kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/root/fstab.rk30board:root/fstab.rk30board \
    $(LOCAL_PATH)/root/init.rk30board.rc:root/init.rk30board.rc \
    $(LOCAL_PATH)/root/init.rk30board.usb.rc:root/init.rk30board.usb.rc \
    $(LOCAL_PATH)/root/init.connectivity.rc:root/init.connectivity.rc \
    $(LOCAL_PATH)/root/ueventd.rk30board.rc:root/ueventd.rk30board.rc \
    $(LOCAL_PATH)/root/rk30xxnand_ko.ko.3.0.36+:root/rk30xxnand_ko.ko.3.0.36+

PRODUCT_PACKAGES += \
    charger_res_images \
    charger

# Libs
PRODUCT_PACKAGES += \
    audio_policy.default \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default

# Configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/asound.conf:/system/etc/asound.conf \
    $(LOCAL_PATH)/config/audio_policy.conf:/system/etc/audio_policy.conf \
    $(LOCAL_PATH)/config/media_codecs.xml:/system/etc/media_codecs.xml \
    $(LOCAL_PATH)/config/media_profiles.xml:/system/etc/media_profiles.xml \
    $(LOCAL_PATH)/config/media_profiles_default.xml:/system/etc/media_profiles_default.xml \
    $(LOCAL_PATH)/config/p2p_supplicant_overlay.conf:/system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/config/wpa_supplicant_overlay.conf:/system/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_TAGS += dalvik.gc.type-precise

# Hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Wifi
PRODUCT_PACKAGES += \
    dhcpcd.conf \
    hostapd \
    hostapd_default.conf \
    libwpa_client \
    macloader \
    wpa_supplicant \
    wpa_supplicant.conf

# Default props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    debug.hwui.render_dirty_regions=false \
    ro.config.facelock=enable_facelock \
    persist.facelock.detect_cutoff=5000 \
    persist.facelock.recog_cutoff=5000 \
    ro.audio.flinger_standbytime_ms=1000 \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    dalvik.vm.debug.alloc=0

$(call inherit-product-if-exists, vendor/hisense/sero8/sero8-vendor.mk)

# Dalvik heap
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
