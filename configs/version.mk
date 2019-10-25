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

# Pixel Dust ROM versioning
ROM_VERSION := PixelDust-X
BUILD_VERSION := caf

ifndef SIGN_KEY
  SIGN_KEY := UNOFFICIAL
endif
PRODUCT_BUILD_PROP_OVERRIDES := TARGET_BUILD_TYPE=user
BUILD_DATE := $(shell date -u +%Y%m%d)
BUILD_TIME := $(shell date -u +%H%M)
BUILD_TIMESTAMP := $(shell date -u +%s)

# Pixel Dust ROM package name 
PIXELDUST_VERSION := $(ROM_VERSION)-$(BUILD_VERSION)-$(TARGET_DEVICE)-$(shell date +%Y%m%d-%H%M)

PRODUCT_PRODUCT_PROPERTIES += \
    com.pixeldust.fingerprint=$(PIXELDUST_VERSION) \
    ro.pixeldust.version=$(ROM_VERSION)-$(BUILD_VERSION)-$(TARGET_DEVICE)-$(SIGN_KEY) \
    ro.pixeldust.ota.version=$(PIXELDUST_VERSION) \
    ro.pixeldust.ota.version_code=$(BUILD_VERSION) \
    ro.pixeldust.ota.timestamp=$(BUILD_TIMESTAMP) \
    ro.pixeldust.ota.build_date_utc=$(BUILD_DATE)-$(BUILD_TIME)

# Pixel Dust OTA
ifneq ($(IS_GENERIC_SYSTEM_IMAGE), true)
ifeq ($(SIGN_KEY), RELEASE)

PRODUCT_PACKAGES += \
    Updates

PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/etc/privapp-permissions/com.pixeldust.updater.xml:system/etc/permissions/com.pixeldust.updater.xml

PRODUCT_PRODUCT_PROPERTIES += \
    sys.ota.disable_uncrypt=1 \
    pixeldust.updater.allow_downgrading=1

endif
endif
