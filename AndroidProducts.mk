#
# SPDX-FileCopyrightText: 2025 The LineageOS Project
# SPDX-FileCopyrightText: 2025 Yet Another AOSP Project
# SPDX-FileCopyrightText: 2025 The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/yaap_cheetah.mk \
    $(LOCAL_DIR)/yaap_panther.mk

COMMON_LUNCH_CHOICES := \
    yaap_panther-user \
    yaap_cheetah-user
