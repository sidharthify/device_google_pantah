#
# Copyright (C) The Android Open Source Project
# Copyright (C) The LineageOS Project
# Copyright (C) Yet Another AOSP Project
#

# Inherit common device configuration
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# HBM
PRODUCT_PACKAGES += \
    HbmSVManagerOverlayPanther

# Init
PRODUCT_PACKAGES += \
    init.recovery.panther.touch.rc

# Recovery files
PRODUCT_COPY_FILES += \
        $(DEVICE_PATH)/init/init.recovery.pantah.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.panther.rc

# NFC
PRODUCT_PACKAGES += \
	NfcOverlayPanther

# WiFi Overlay
PRODUCT_PACKAGES += \
    WifiOverlay2022_P10

# SKU specific RROs
PRODUCT_PACKAGES += \
    SettingsOverlayG03Z5 \
    SettingsOverlayGQML3 \
    SettingsOverlayGVU6C \
    SettingsOverlayGVU6C_VN \
    SettingsOverlayPanther

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/vendor.prop
