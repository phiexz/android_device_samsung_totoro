# Copyright (C) 2009 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Add device package overlay
  DEVICE_PACKAGE_OVERLAYS += device/samsung/totoro/overlay
  
# Broadcom FM radio
#  $(call inherit-product, vendor/cyanogen/products/bcm_fm_radio.mk)

PRODUCT_PACKAGES += \
    librs_jni \
    libOmxCore \
    make_ext4fs \
    sec_touchscreen.kcm \
    setup_fs \
    brcm_patchram_plus \
    SamsungServiceMode \
    rzscontrol \
    bdaddr_read \
    dump_image \
    e2fsck \
    setup_fs \
    erase_image \
    flash_image \
    screencap \
    dexpreopt
    
# proprietary side of the device
$(call inherit-product-if-exists, vendor/samsung/totoro/totoro-vendor.mk)
    
DISABLE_DEXPREOPT := false

# Add LDPI assets, in addition to MDPI
  PRODUCT_LOCALES += ldpi mdpi

# Extra overlay for LDPI
  PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/ldpi

# Used by BusyBox
# KERNEL_MODULES_DIR:=/system/lib/modules

# Enable Windows Media if supported by the board
# WITH_WINDOWS_MEDIA:=true

# density in DPI of the LCD of this board. This is used to scale the UI
# appropriately. If this property is not defined, the default value is 160 dpi. 
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=120

# Kernel debug file
PRODUCT_COPY_FILES += \
	device/samsung/totoro/klogtail:system/xbin/klogtail

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

#    device/samsung/totoro/media_profiles.xml:system/etc/media_profiles.xml \
PRODUCT_COPY_FILES += \
    device/samsung/totoro/dhcpcd.conf:system/etc/dhcpcd.conf \
    device/samsung/totoro/vold.fstab:system/etc/vold.fstab \
    device/samsung/totoro/dbus.conf:system/etc/dbus.conf \
    device/samsung/totoro/recovery.fstab:recovery/root/etc/recovery.fstab 

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
# 131072 is for samsung's fimg (gles 2.0)
# 65537 is for openfimg (gles 1.1)
PRODUCT_PROPERTY_OVERRIDES := \
    ro.opengles.version=131072

# Keyboard maps
PRODUCT_COPY_FILES += \
	device/samsung/totoro/prebuilt/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
	device/samsung/totoro/prebuilt/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
	device/samsung/totoro/prebuilt/keychars/sec_key.kcm.bin:system/usr/keychars/sec_key.kcm.bin \
	device/samsung/totoro/prebuilt/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
	device/samsung/totoro/prebuilt/keylayout/bcm_headset.kl:system/usr/keylayout/bcm_headset.kl \
	device/samsung/totoro/prebuilt/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
	device/samsung/totoro/prebuilt/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
	device/samsung/totoro/prebuilt/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
	device/samsung/totoro/prebuilt/keylayout/sec_keypad.kl:system/usr/keylayout/sec_keypad.kl 

# wifi
PRODUCT_COPY_FILES += \
	device/samsung/totoro/wifi/bcm4330_aps.bin:system/etc/wifi/bcm4330_aps.bin \
	device/samsung/totoro/wifi/bcm4330_mfg.bin:system/etc/wifi/bcm4330_mfg.bin \
	device/samsung/totoro/wifi/bcm4330_sta.bin:system/etc/wifi/bcm4330_sta.bin \
	device/samsung/totoro/wifi/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \
	device/samsung/totoro/wifi/nvram.txt:system/etc/wifi/nvram.txt \
	device/samsung/totoro/wifi/wifi.conf:system/etc/wifi/wifi.conf \
	device/samsung/totoro/wifi/iperf:system/etc/wifi/iperf \
	device/samsung/totoro/wifi/RC_248_WPA.bin:system/etc/wifi/RC_248_WPA.bin \
	device/samsung/totoro/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf 

# ril
PRODUCT_COPY_FILES += \
	device/samsung/totoro/prebuilt/ril/libbrcm_ril.so:system/lib/libbrcm_ril.so \
	device/samsung/totoro/prebuilt/ril/rild:system/bin/rild


PRODUCT_COPY_FILES += \
	device/samsung/totoro/prebuilt/hw/gralloc.default.so:system/lib/hw/gralloc.bcm21553.so \
	device/samsung/totoro/prebuilt/hw/lights.bcm21553.so:system/lib/hw/lights.bcm21553.so \
	device/samsung/totoro/prebuilt/hw/sensors.default.so:system/lib/hw/sensors.bcm21553.so \
	device/samsung/totoro/prebuilt/hw/libGLES_hgl.so:system/lib/egl/libGLES_hgl.so \
	device/samsung/totoro/prebuilt/libsurfaceflinger.so:system/lib/libsurfaceflinger.os \
	device/samsung/totoro/prebuilt/hw/libGLES_hgl.so:system/lib/egl/libGLES_hgl.so 
#        device/samsung/totoro/prebuilt/libui.so:system/lib/libui.so


PRODUCT_PROPERTY_OVERRIDES += \
       wifi.interface=eth0 \
       wifi.supplicant_scan_interval=20 \
       ro.telephony.ril_class=samsung \
       ro.telephony.sends_barcount=1 \
       mobiledata.interfaces=pdp0,eth0,gprs,ppp0 \
       dalvik.vm.dexopt-flags=m=y \
       dalvik.vm.execution-mode=int:jit \
       dalvik.vm.heapsize=64m \
       persist.sys.purgeable_assets=0 \
       ro.compcache.default=0 \
       persist.sys.use_dithering=0 \
       persist.sys.use_16bpp_alpha=1 \
       dev.sfbootcomplete=0 \
       persist.sys.vold.switchexternal=1


# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
        ro.com.google.locationfeatures=1 \
        ro.com.google.networklocation=1


# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false
    
# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available
$(call inherit-product-if-exists, vendor/samsung/totoro/totoro-vendor-blobs.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_totoro
PRODUCT_DEVICE := totoro
PRODUCT_MODEL := GT-S5360
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := Samsung

