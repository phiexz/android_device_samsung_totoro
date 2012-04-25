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

# config.mk
#
# Product-specific compile-time definitions.
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from the proprietary version
-include vendor/samsung/totoro/BoardConfigVendor.mk

# Board
TARGET_BOARD_PLATFORM := bcm21553
TARGET_CPU_ABI := armeabi-v6l
#TARGET_CPU_ABI := armeabi
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv6-vfp

TARGET_BOOTLOADER_BOARD_NAME := GT-S5360

TARGET_OTA_ASSERT_DEVICE := totoro,GT-S5360

HAVE_HTC_AUDIO_DRIVER := true
BOARD_USES_GENERIC_AUDIO := true
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true
TARGET_PROVIDES_LIBAUDIO := true

# Camera
USE_CAMERA_STUB := true
#BOARD_USE_FROYO_LIBCAMERA := true
#BOARD_CAMERA_LIBRARIES := libcamera
#BUILD_PV_VIDEO_ENCODERS := 1
BOARD_V4L2_DEVICE := /dev/video2
BOARD_CAMERA_DEVICE := /dev/video0
BOARD_USE_JPEG := true
#BOARD_USE_CAF_LIBCAMERA_GB_REL := true

DEFAULT_FB_NUM := 0

# 2d/3d
TARGET_BOARD_PLATFORM_GPU := hgl
#TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
BOARD_EGL_CFG := device/samsung/totoro/egl.cfg
#BOARD_USES_COPYBIT := true
BOARD_NO_RGBX_8888 := true
BOARD_USE_SCREENCAP := true
TARGET_DO_NOT_SETS_CAN_DRAW := true
#BOARD_AVOID_DRAW_TEXTURE_EXTENSION := true
#BOARD_USES_HW_RENDER := true

# GPS
#BOARD_GPS_LIBRARIES := libsecgps libsecril-client
#BOARD_USES_GPSSHIM := true

# sensors
#TARGET_USES_OLD_LIBSENSORS_HAL := true
#TARGET_SENSORS_NO_OPEN_CHECK := true

BOARD_MOBILEDATA_INTERFACE_NAME = "pdp0"

# Misc
WITH_DEXPREOPT := true
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8
BUILD_WITH_FULL_STAGEFRIGHT := true

# FM Radio
#BOARD_HAVE_FM_RADIO := true
#TARGET_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
#TARGET_GLOBAL_CPPFLAGS += -DHAVE_FM_RADIO
#BOARD_FM_DEVICE := si4709

TARGET_NO_RECOVERY := false
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true
TARGET_NO_RADIOIMAGE := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_FORCE_STATIC_A2DP := true
#BT_ALT_STACK := true
#BOARD_HAVE_BLUETOOTH_BCM := true
#BRCM_BT_USE_BTL_IF := true
#BRCM_BTL_INCLUDE_A2DP := true

# usb
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/lm-2/gadget/lun0/file"
BOARD_UMS_LUNFILE := "/sys/devices/lm-2/gadget/lun0/file"

# Kernel : console=ttySAC1,115200 loglevel=4 no_console_suspend
BOARD_KERNEL_CMDLINE := console=ttyS0,115200n8
BOARD_KERNEL_BASE := 81600000
BOARD_NAND_PAGE_SIZE := 4096 -s 128
BOARD_KERNEL_PAGESIZE := 4096
BOARD_BOOTIMAGE_PARTITION_SIZE := 7864320
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 196608000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2013265920
BOARD_FLASH_BLOCK_SIZE := 4096

# Wifi
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WLAN_DEVICE 	    := bcm4330
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_FW_STA_PATH     := "/system/etc/wifi/bcm4330_sta.bin"
WIFI_DRIVER_FW_AP_PATH      := "/system/etc/wifi/bcm4330_aps.bin"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/wifi/bcm4330_sta.bin nvram_path=/system/etc/wifi/nvram.txt dhd_watchdog_ms=10 dhd_poll=1"
WIFI_DRIVER_MODULE_NAME     := "dhd"

#
BOARD_RECOVERY_IGNORE_BOOTABLES := true
BOARD_HAS_NO_RECOVERY_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_NO_MISC_PARTITION := true

# Recovery
BOARD_USES_BOOTMENU := false
#TARGET_USERIMAGES_USE_EXT4 := true
BOARD_PROVIDES_BOOTMODE := true
BOARD_USES_BML_OVER_MTD := false
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/totoro/recovery/recovery_ui.c
BOARD_BOOT_DEVICE := /dev/block/bml7
BOARD_DATA_DEVICE := /dev/block/stl11
BOARD_DATA_FILESYSTEM := rfs
BOARD_DATA_FILESYSTEM_OPTIONS := llw,check=no,nosuid,nodev
BOARD_HAS_DATADATA := false
BOARD_SYSTEM_DEVICE := /dev/block/stl9
BOARD_SYSTEM_FILESYSTEM := rfs
BOARD_SYSTEM_FILESYSTEM_OPTIONS := llw,check=no
#BOARD_BML_BOOT := "/dev/block/bml5"
BOARD_CACHE_DEVICE := /dev/block/stl10
BOARD_CACHE_FILESYSTEM := rfs
BOARD_CACHE_FILESYSTEM_OPTIONS := llw,check=no,nosuid,nodev
BOARD_SDEXT_DEVICE := /dev/block/mmcblk0p2
BOARD_SDEXT_FILESYSTEM := auto
BOARD_HAS_PARAMFS := false
BOARD_USES_BMLUTILS := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk0p1
BOARD_HAS_SDCARD_INTERNAL := false
BOARD_HAS_DOWNLOAD_MODE := true
TARGET_ROOT_IS_RECOVERY := true
TARGET_BOOT_IS_RAMDISK := true
BOARD_RECOVERY_IGNORE_BOOTABLES := true
TARGET_RECOVERY_PRE_COMMAND := "echo 1 > /cache/.startrecovery; sync;"
BOARD_RECOVERY_HANDLES_MOUNT := true
TARGET_NO_KERNEL := true
BOARD_LDPI_RECOVERY := true



