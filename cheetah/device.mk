#
# Copyright (C) The Android Open Source Project
# Copyright (C) The LineageOS Project
# Copyright (C) Yet Another AOSP Project
#

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/cheetah/overlay

# Inherit common configuration
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# Init
PRODUCT_PACKAGES += \
    init.recovery.cheetah.touch.rc

# Recovery files
PRODUCT_COPY_FILES += \
        $(DEVICE_PATH)/init/init.recovery.pantah.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.cheetah.rc

# UWB
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.uwb.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.uwb.xml

# NFC
PRODUCT_PACKAGES += \
	NfcOverlayCheetah

# WiFi/UWB Overlays
PRODUCT_PACKAGES += \
    UwbOverlayC10 \
    WifiOverlay2022_C10

# SKU specific RROs
PRODUCT_PACKAGES += \
    SettingsOverlayGFE4J \
    SettingsOverlayGE2AE \
    SettingsOverlayGP4BC \
    SettingsOverlayCheetah

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/vendor.prop

