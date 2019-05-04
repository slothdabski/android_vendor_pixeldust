# Copyright (C) 2018-2019 The Pixel Dust Project
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

# Disable vendor restrictions
PRODUCT_RESTRICT_VENDOR_FILES := false

# Disable qmi EAP-SIM security
DISABLE_EAP_PROXY := true

# Google property overides
ifeq ($(filter marlin sailfish,$(TARGET_PRODUCT)),)
PRODUCT_PRODUCT_PROPERTIES += \
    keyguard.no_require_sim=true \
    ro.com.android.dataroaming=false
endif

PRODUCT_PRODUCT_PROPERTIES += \
    ro.carrier=unknown \
    ro.opa.eligible_device=true

# Enable tethering
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.dun.override=0

# Bluetooth Audio (A2DP)
PRODUCT_PACKAGES += libbthost_if

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += libprotobuf-cpp-full

# Include support for additional filesystems
PRODUCT_PACKAGES += \
    e2fsck \
    mke2fs \
    tune2fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g

# Launcher
PRODUCT_PACKAGES += \
    Launcher3QuickStep

# LiveWallpapers
PRODUCT_PACKAGES += \
    LiveWallpapersPicker

# Telephony packages
PRODUCT_PACKAGES += \
    Stk \
    CellBroadcastReceiver

# TCP Connection Management
PRODUCT_PACKAGES += tcmiface
PRODUCT_BOOT_JARS += tcmiface

# RCS Service
PRODUCT_PACKAGES += \
    rcscommon \
    rcscommon.xml \
    rcsservice \
    rcs_service_aidl \
    rcs_service_aidl.xml \
    rcs_service_aidl_static \
    rcs_service_api \
    rcs_service_api.xml

# APNs Conf
PRODUCT_COPY_FILES += vendor/pixeldust/prebuilt/etc/apns-conf.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/apns-conf.xml

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/pixeldust/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/pixeldust/prebuilt/bin/50-base.sh:system/addon.d/50-base.sh

# Copy all init rc files
$(foreach f,$(wildcard vendor/pixeldust/prebuilt/etc/init/*.rc),\
	$(eval PRODUCT_COPY_FILES += $(f):system/etc/init/$(notdir $f)))

# Include PixelDust sepolicy
-include device/pixeldust/sepolicy/common/sepolicy.mk
