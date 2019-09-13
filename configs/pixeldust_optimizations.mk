# Copyright (C) 2018 The Pixel Dust Project
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

# Recommend using the non debug dexpreopter
USE_DEX2OAT_DEBUG := false

# SystemUITests
EXCLUDE_SYSTEMUI_TESTS := true

# SDClang Environment Variables
export SDCLANG_AE_CONFIG=$(pwd)/vendor/pixeldust/sdclang/sdclangAE.json
export SDCLANG_CONFIG=$(pwd)/vendor/pixeldust/sdclang/sdclang.json
export SDCLANG_SA_ENABLED=false

ifneq ($(HOST_OS),linux)
ifneq ($(sdclang_already_warned),true)
$(warning **********************************************)
$(warning * SDCLANG is not supported on non-linux hosts.)
$(warning **********************************************)
sdclang_already_warned := true
endif
else
# include definitions for SDCLANG
include vendor/pixeldust/sdclang/sdclang.mk
endif
