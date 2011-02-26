#
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

## Include the smdkc110.rc file
PRODUCT_COPY_FILES += \
    device/samsung/epic/init.smdkc110.rc:root/init.smdkc110.rc

$(call inherit-product-if-exists, vendor/samsung/SPH-D700/SPH-D700-vendor.mk)

## Property Overrides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    rild.libpath=/system/lib/libsec-ril40.so \
  	rild.libargs=-d[SPACE]/dev/ttyS0 \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=15 \
	ro.wifi.channels=11

	#sprint cdma stuff
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=android-sprint-us \
	ro.cdma.home.operator.numeric=310120 \
	ro.cdma.home.operator.alpha=Sprint \
  	net.cdma.pppd.authtype=require-pap \
	net.cdma.pppd.user=user[SPACE]SprintNextel \
	net.cdma.datalinkinterface=/dev/ttyCDMA0 \
	net.interfaces.defaultroute=cdma \
	net.cdma.ppp.interface=ppp0 \
	net.connectivity.type=CDMA1 \
	gsm.operator.alpha=Sprint \
	gsm.operator.numeric=310120 \
	gsm.operator.iso-country=us \
	gsm.operator.isroaming=false \
	gsm.current.phone-type=2 \
	ro.csc.sales_code=SPR \
	ril.sales_code=SPR \
	ro.carrier=Sprint \
	net.dns1=8.8.8.8 \
	net.dns2=8.8.4.4

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.startheapsize=8m \
    dalvik.vm.heapsize=48m
	
#	For date interfaces
PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=eth0,ppp0
	
	
# Epic uses high-density artwork where available
PRODUCT_LOCALES := hdpi

DEVICE_PACKAGE_OVERLAYS += device/samsung/epic/overlay

# media profiles and capabilities spec
$(call inherit-product, device/samsung/epic/media_a1026.mk)

# These are the OpenMAX IL configuration files
PRODUCT_COPY_FILES += \
	device/samsung/epic/sec_mm/sec_omx/sec_omx_core/secomxregistry:system/etc/secomxregistry

# These are the OpenMAX IL modules
PRODUCT_PACKAGES += \
	libSEC_OMX_Core \
	libOMX.SEC.AVC.Decoder \
	libOMX.SEC.M4V.Decoder \
	libOMX.SEC.M4V.Encoder \
	libOMX.SEC.AVC.Encoder

# Misc other modules
#PRODUCT_PACKAGES += \
#	overlay.s5pc110 \
#	copybit.s5pc110 

# Libs
PRODUCT_PACKAGES += \
	libcamera \
	libstagefrighthw


# media config xml file
PRODUCT_COPY_FILES += \
    device/samsung/epic/media_profiles.xml:system/etc/media_profiles.xml

# asound.conf
PRODUCT_COPY_FILES += \
    device/samsung/epic/prebuilt/asound.conf:system/etc/asound.conf

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

 

# Keylayout / Keychars
PRODUCT_COPY_FILES += \
     device/samsung/epic/prebuilt/keylayout/s3c-keypad.kl:system/usr/keylayout/s3c-keypad.kl \
     device/samsung/epic/prebuilt/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
     device/samsung/epic/prebuilt/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
     device/samsung/epic/prebuilt/keylayout/qt602240_ts_input.kl:system/usr/keylayout/qt602240_ts_input.kl \
     device/samsung/epic/prebuilt/keylayout/melfas-touchkey.kl:system/usr/keylayout/melfas-touchkey.kl \
     device/samsung/epic/prebuilt/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
     device/samsung/epic/prebuilt/keychars/s3c-keypad.kcm.bin:system/usr/keychars/s3c-keypad.kcm.bin \
     device/samsung/epic/prebuilt/keychars/sec_jack.kcm.bin:system/usr/keychars/sec_jack.kcm.bin \
     device/samsung/epic/prebuilt/keychars/melfas-touchkey.kcm.bin:system/usr/keychars/melfas-touchkey.kcm.bin \
     device/samsung/epic/prebuilt/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
     device/samsung/epic/prebuilt/keychars/qt602240_ts_input.kcm.bin:system/usr/keychars/qt602240_ts_input.kcm.bin \
     device/samsung/epic/prebuilt/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin  

PRODUCT_COPY_FILES += \
    device/samsung/epic/prebuilt/vold.conf:system/etc/vold.conf \
    device/samsung/epic/prebuilt/vold.fstab:system/etc/vold.fstab
# Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/samsung/epic/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel


$(call inherit-product, build/target/product/full.mk)


PRODUCT_NAME := full_epic
PRODUCT_DEVICE := epic
PRODUCT_MODEL := SAMSUNG-SPH-D700
PRODUCT_BRAND := Samsung
PRODUCT_MANUFACTURER := Samsung
TARGET_IS_GALAXYS := true
