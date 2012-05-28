#
# Copyright (C) 2012 The Android Open-Source Project
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
TARGET_BOOTLOADER_BOARD_NAME := crane
TARGET_BOARD_PLATFORM := sun4i

USE_CAMERA_STUB := false
BOARD_USES_GENERIC_AUDIO := false
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
#BOARD_PROVIDES_LIBRIL := true

#CPU stuff
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_CUSTOM_RELEASETOOL := ./device/allwinner/novo7a/releasetools/squisher

BOARD_HAVE_BLUETOOTH := true
TARGET_USES_CUSTOM_VIBRATOR_PATH := "/sys/class/timed_output/sun4i-vibrator/enable"
BOARD_HAS_SDCARD_INTERNAL := true

TARGET_USE_CUSTOM_LUN_FILE_PATH = "/sys/class/android_usb/android0/f_mass_storage/lun%d/file"
TARGET_USE_CUSTOM_SECOND_LUN_NUM := 1
BOARD_VOLD_MAX_PARTITIONS := 20

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 268435456
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824
BOARD_FLASH_BLOCK_SIZE := 4096

#EGL stuff
BOARD_EGL_CFG := device/allwinner/novo7a/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_USE_SKIA_LCDTEXT := true

#Recovery Stuff
#TARGET_RECOVERY_UI_LIB := librecovery_ui_generic
#TARGET_RECOVERY_UPDATER_LIBS += librecovery_updater_generic
TARGET_RECOVERY_PRE_COMMAND := "echo -n boot-recovery | busybox dd of=/dev/block/nandf count=1 conv=sync; sync"
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/allwinner/novo7a/recovery_keys.c
BOARD_USE_LEGACY_TOUCHSCREEN := true

#Accelerometer
SW_BOARD_USES_GSENSOR_TYPE := bma250
SW_BOARD_GSENSOR_DIRECT_X := true
SW_BOARD_GSENSOR_DIRECT_Y := false
SW_BOARD_GSENSOR_DIRECT_Z := true
SW_BOARD_GSENSOR_XY_REVERT := true

#Wifi stuff
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
TARGET_CUSTOM_WIFI := ../../device/allwinner/common/wifi.c
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/r8712u.ko"
WIFI_DRIVER_MODULE_NAME     := r8712u
WIFI_DRIVER_FW_PATH_STA     := r8712u
WIFI_DRIVER_FW_PATH_AP      := r8712u
WIFI_DRIVER_SOCKET_IFACE    := wlan0

#WPA_SUPPLICANT_VERSION := VER_0_8_X  //Prebuilt
#SW_BOARD_USR_WIFI := nanowifi
#TARGET_CUSTOM_WIFI := ../../device/allwinner/novo7a/wifi.c
#WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/nano_ksdio.ko"
#WIFI_DRIVER_MODULE_NAME     := nano_ksdio
#WIFI_FIRMWARE_MODULE_PATH   := "/system/lib/modules/nano_if.ko"
#WIFI_FIRMWARE_MODULE_NAME   := nano_if
#WIFI_FIRMWARE_MODULE_ARG    := "nrx_config=/vendor/firmware"

BOARD_USES_UBOOT := false
BOARD_USES_UIMAGE := true
#CROSS_COMPILE := "arm-linux-gnueabi-"

#TARGET_KERNEL_SOURCE := $(ANDROID_BUILD_TOP)/linux-allwinner
#TARGET_KERNEL_CONFIG := sun4i_ivi_defconfig

#TARGET_KERNEL_MODULES := NOVO7_MODULES

#NOVO7_MODULES:
#	make -C $(ANDROID_BUILD_TOP)/kernel/allwinner/common/modules/wifi/nano-c047.12 \
#	ARCH="arm" CROSS_COMPILE="arm-eabi-" KERNEL_DIR="$(KERNEL_OUT)" INSTALL_DIR="$(ANDROID_BUILD_TOP)/$(KERNEL_MODULES_OUT)" all REPORT_LOG=n
#	mv hardware/allwinner/novo7a/wifi/nano-c047.12/nano_ksdio.ko $(ANDROID_BUILD_TOP)/$(KERNEL_MODULES_OUT)
#	mv hardware/allwinner/novo7a/wifi/nano-c047.12/nano_if.ko $(ANDROID_BUILD_TOP)/$(KERNEL_MODULES_OUT)

#	make -C $(ANDROID_BUILD_TOP)/kernel/allwinner/common/modules/mali \
#	ARCH="arm" CROSS_COMPILE="arm-eabi-" LICHEE_KDIR="$(ANDROID_BUILD_TOP)/kernel/allwinner/common/" \
#	LICHEE_MOD_DIR="$(ANDROID_BUILD_TOP)/$(KERNEL_MODULES_OUT)" \
#	CONFIG_CHIP_ID=1123 O="$(KERNEL_OUT)"

# Beware: set only prebuilt OR source+config
TARGET_PREBUILT_KERNEL := $(ANDROID_BUILD_TOP)/device/allwinner/novo7a/kernel-3.0.31
