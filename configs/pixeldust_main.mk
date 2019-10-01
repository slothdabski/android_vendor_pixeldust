# Copyright (C) 2018-2019 The PixelDust Project
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

# PixelDust Wallpapers
PRODUCT_PACKAGES += \
    PixelDustWallpapers

# Cutout overlay
PRODUCT_PACKAGES += \
    HideCutout \
    StatusBarStock

# Longshot
PRODUCT_PACKAGES += \
    Longshot

# Recorder
PRODUCT_PACKAGES += Recorder
PRODUCT_COPY_FILES += vendor/pixeldust/prebuilt/etc/privapp-permissions/privapp-permissions-recorder.xml:system/etc/permissions/privapp-permissions-recorder.xml

# Weather
PRODUCT_PACKAGES += WeatherClient
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/etc/permissions/org.pixelexperience.weather.client.xml:system/etc/permissions/org.pixelexperience.weather.client.xml \
    vendor/pixeldust/prebuilt/etc/default-permissions/org.pixelexperience.weather.client.xml:system/etc/default-permissions/org.pixelexperience.weather.client.xml

# PixelDust Theme
PRODUCT_PACKAGES += \
    ThemePicker

-include vendor/themes/common.mk

# PixelDust overlay
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/pixeldust/overlay/common

# Fonts
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/etc/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml \
    vendor/pixeldust/prebuilt/fonts/GoogleSans-BoldItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-BoldItalic.ttf \
    vendor/pixeldust/prebuilt/fonts/GoogleSans-Bold.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-Bold.ttf \
    vendor/pixeldust/prebuilt/fonts/GoogleSans-Italic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-Italic.ttf \
    vendor/pixeldust/prebuilt/fonts/GoogleSans-MediumItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-MediumItalic.ttf \
    vendor/pixeldust/prebuilt/fonts/GoogleSans-Medium.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-Medium.ttf \
    vendor/pixeldust/prebuilt/fonts/GoogleSans-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-Regular.ttf

# Include needed privapp permissions whitelist
PRODUCT_COPY_FILES += vendor/pixeldust/prebuilt/etc/privapp-permissions/pixeldust-permissions.xml:system/etc/sysconfig/pixeldust-permissions.xml
