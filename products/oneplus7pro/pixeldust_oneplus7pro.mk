
# Copyright (C) 2019 The PixelDust Project
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

# Bootanimation
BOOTANIMATION := 1440

# Release name
PRODUCT_RELEASE_NAME := OnePlus 7 Pro
export TARGET_DEVICE=oneplus7pro

# AOSP Surfaceflinger
TARGET_USE_AOSP_SURFACEFLINGER := true
QCOM_HARDWARE_VARIANT := sm8150
TARGET_USES_NON_LEGACY_POWERHAL := true

TARGET_USES_PREBUILT_VENDOR_SEPOLICY := true
TARGET_BOARD_PLATFORM := msmnile
TARGET_USES_QCOM_LATEST_SEPOLICY := true

include device/qcom/sepolicy/sepolicy.mk
include device/pa/sepolicy/qcom/sepolicy.mk

# Inherit from those products. Most specific first.
$(call inherit-product, device/oneplus/oneplus7pro/device.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Include common PixelDust stuff
include vendor/pixeldust/configs/pixeldust_phone.mk

include device/qcom/common/av/qti-av.mk
include device/qcom/common/bt/qti-bt.mk
include device/qcom/common/perf/qti-perf.mk
include device/qcom/common/telephony/qti-telephony.mk
include device/qcom/common/wfd/qti-wfd.mk

# Include optional stuff (e.g. prebuilt apps)
include vendor/pixeldust/configs/system_optional.mk

# Google Apps
$(call inherit-product-if-exists, vendor/gapps/gapps.mk)
REMOVE_GAPPS_PACKAGES := GoogleCamera

PRODUCT_NAME := pixeldust_oneplus7pro
PRODUCT_DEVICE := oneplus7pro
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := OnePlus 7 Pro
PRODUCT_MANUFACTURER := OnePlus

# Build info
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE=OnePlus7Pro \
    PRODUCT_NAME=OnePlus7Pro \
    PRIVATE_BUILD_DESC="OnePlus7Pro-user 10 QKQ1.190716.003 1909131115 release-keys"

PRODUCT_PROPERTY_OVERRIDES += \
    ro.pixeldust.maintainer="slothdabski" \
    ro.pixeldust.device="guacamole"

# Copy device specific prebuilt files.
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

PRODUCT_AAPT_CONFIG := xxxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi
PRODUCT_CHARACTERISTICS := nosdcard
