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

# EGL Stuff
PRODUCT_COPY_FILES += \
	device/allwinner/novo7a/prebuilt/lib/egl/libEGL_mali.so:system/lib/egl/libEGL_mali.so \
	device/allwinner/novo7a/prebuilt/lib/egl/libGLESv1_CM_mali.so:system/lib/egl/libGLESv1_CM_mali.so \
	device/allwinner/novo7a/prebuilt/lib/egl/libGLESv2_mali.so:system/lib/egl/libGLESv2_mali.so \
	device/allwinner/novo7a/prebuilt/lib/libMali.so:system/lib/libMali.so \
	device/allwinner/novo7a/prebuilt/lib/libUMP.so:system/lib/libUMP.so \
	device/allwinner/novo7a/prebuilt/lib/libMali.so:obj/lib/libMali.so \
	device/allwinner/novo7a/prebuilt/lib/libUMP.so:obj/lib/libUMP.so

# Camera
PRODUCT_COPY_FILES += \
	device/allwinner/novo7a/prebuilt/etc/camera.cfg:system/etc/camera.cfg \
    device/allwinner/novo7a/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
	device/allwinner/novo7a/prebuilt/lib/hw/camera.sun4i.so:system/lib/hw/camera.sun4i.so \

# GPS (will be removed in future)
PRODUCT_COPY_FILES += \
	device/allwinner/novo7a/prebuilt/lib/hw/gps.sun4i.so:system/lib/hw/gps.sun4i.so \

# OTG/3G stuff
PRODUCT_COPY_FILES += \
	device/allwinner/novo7a/prebuilt/bin/u3gmonitor:system/bin/u3gmonitor \
	device/allwinner/novo7a/prebuilt/etc/3g_dongle.cfg:system/etc/3g_dongle.cfg \
	device/allwinner/novo7a/prebuilt/bin/usb_modeswitch:system/bin/usb_modeswitch \
	device/allwinner/novo7a/prebuilt/etc/usb_modeswitch.sh:system/etc/usb_modeswitch.sh \

PRODUCT_COPY_FILES += $(shell test -d device/allwinner/novo7a/prebuilt/etc/usb_modeswitch.d && \
	find device/allwinner/novo7a/prebuilt/etc/usb_modeswitch.d -name '*' \
	-printf '%p:system/etc/usb_modeswitch.d/%f ')

# Init Add-Ons (modules, etc)
PRODUCT_COPY_FILES += $(shell test -d device/allwinner/novo7a/prebuilt/etc/init.d && \
	find device/allwinner/novo7a/prebuilt/etc/init.d -name '*' \
	-printf '%p:system/etc/init.d/%f ')

# Other stuff
PRODUCT_COPY_FILES += \
	device/allwinner/novo7a/prebuilt/usr/keylayout/hv_keypad.kl:system/usr/keylayout/hv_keypad.kl \
	device/allwinner/novo7a/prebuilt/usr/keylayout/axp20-supplyer.kl:system/usr/keylayout/axp20-supplyer.kl \
	device/allwinner/novo7a/prebuilt/usr/keylayout/sun4i-keyboard.kl:system/usr/keylayout/sun4i-keyboard.kl \
	device/allwinner/novo7a/prebuilt/usr/keylayout/sun4i-ir.kl:system/usr/keylayout/sun4i-ir.kl \
	device/allwinner/novo7a/prebuilt/usr/idc/ft5x_ts.idc:system/usr/idc/ft5x_ts.idc \
	device/allwinner/novo7a/prebuilt/usr/idc/gt80x.idc:system/usr/idc/gt80x.idc \
	device/allwinner/novo7a/prebuilt/usr/idc/qwerty.idc:system/usr/idc/qwerty.idc \
	device/allwinner/novo7a/prebuilt/usr/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
	device/allwinner/novo7a/prebuilt/etc/vold.fstab:system/etc/vold.fstab \
	device/allwinner/novo7a/prebuilt/etc/gps.conf:system/etc/gps.conf \
	device/allwinner/novo7a/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml \
	device/allwinner/novo7a/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	device/allwinner/novo7a/prebuilt/lib/liballwinner-ril.so:system/lib/liballwinner-ril.so \
	device/allwinner/novo7a/prebuilt/bin/erase_misc.sh:system/bin/erase_misc.sh \
    device/allwinner/novo7a/prebuilt/bootanimation.zip:system/media/bootanimation.zip \

# Nano Wi-Fi prebuilt supplicant
#PRODUCT_COPY_FILES += \
#	device/allwinner/novo7a/prebuilt/bin/wpa_supplicant:system/bin/wpa_supplicant \

# Firmwares
PRODUCT_COPY_FILES += $(shell test -d device/allwinner/novo7a/prebuilt/vendor/firmware && \
	find device/allwinner/novo7a/prebuilt/vendor/firmware -name '*' \
	-printf '%p:system/vendor/firmware/%f ')

# ROOT
PRODUCT_COPY_FILES += \
	device/allwinner/novo7a/init.sun4i.rc:root/init.sun4i.rc \
	device/allwinner/novo7a/init.sun4i.usb.rc:root/init.sun4i.usb.rc \
	device/allwinner/novo7a/ueventd.sun4i.rc:root/ueventd.sun4i.rc \
	device/allwinner/novo7a/initlogo.rle:root/initlogo.rle \
	device/allwinner/novo7a/init.rc:root/init.rc \

#end of novo7a-blobs.mk
