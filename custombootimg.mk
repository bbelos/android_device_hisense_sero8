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

LOCAL_PATH := $(call my-dir)

RKCRC := $(HOST_OUT_EXECUTABLES)/rkcrc

INSTALLED_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.img
INSTALLED_RECOVERYIMAGE_TARGET := $(PRODUCT_OUT)/recovery.img

$(INSTALLED_BOOTIMAGE_TARGET): $(INSTALLED_RAMDISK_TARGET) $(RKCRC)
	$(call pretty,"Boot image: $@")
	$(hide) $(RKCRC) -k $(INSTALLED_RAMDISK_TARGET) $(PRODUCT_OUT)/boot.img

$(INSTALLED_RECOVERYIMAGE_TARGET): $(recovery_ramdisk) $(RKCRC)
	@echo ----- Making RK recovery image ------
	$(hide) $(RKCRC) -k $(recovery_ramdisk) $(PRODUCT_OUT)/recovery.img
	@echo ----- Made RK recovery image -------- $@
