#
# SPDX-FileCopyrightText: The Android Open Source Project
PRODUCT_PROPERTY_OVERRIDES += \
PRODUCT_PRODUCT_PROPERTIES += \
TARGET_BOARD_PLATFORM := gs201

AB_OTA_POSTINSTALL_CONFIG += \
	RUN_POSTINSTALL_system=true \
	POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_SOONG_NAMESPACES += \
	hardware/google/av \
	hardware/google/interfaces \
	hardware/google/pixel \
LOCAL_KERNEL := $(TARGET_KERNEL_DIR)/Image.lz4

# OEM Unlock reporting
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.oem_unlock_supported=1

# From system.property
PRODUCT_PROPERTY_OVERRIDES += \
	ro.telephony.default_network=27 \
# SIT-RIL Logging setting
PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.ril.log_mask=3 \
	persist.vendor.ril.log.base_dir=/data/vendor/radio/sit-ril \
	persist.vendor.ril.log.chunk_size=5242880 \
	persist.vendor.ril.log.num_file=3

# Enable reboot free DSDS
PRODUCT_PRODUCT_PROPERTIES += \
	persist.radio.reboot_on_modem_change=false

ifneq ($(BOARD_WITHOUT_RADIO),true)
PRODUCT_PRODUCT_PROPERTIES += \
# Enable Early Camping
PRODUCT_PRODUCT_PROPERTIES += \
	persist.vendor.ril.camp_on_earlier=1

PRODUCT_PROPERTY_OVERRIDES += \
PRODUCT_PRODUCT_PROPERTIES += \
PRODUCT_PRODUCT_PROPERTIES += \
PRODUCT_PRODUCT_PROPERTIES += \
# Carrier configuration default location
PRODUCT_PROPERTY_OVERRIDES += \
PRODUCT_PROPERTY_OVERRIDES += \
	telephony.active_modems.max_count=2

# HWUI
PRODUCT_VENDOR_PROPERTIES += \
PRODUCT_VENDOR_PROPERTIES += \
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
	frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
	frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
PRODUCT_VENDOR_PROPERTIES += \
PRODUCT_VENDOR_PROPERTIES += \
	ro.opengles.version=196610 \
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay

# Enforce the Product interface
PRODUCT_PRODUCT_VNDK_VERSION := current
PRODUCT_ENFORCE_PRODUCT_PARTITION_INTERFACE := true

# Recovery files
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/init/init.recovery.gs201.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.gs201.rc

# Fstab files
# For creating dtbo image
PRODUCT_HOST_PACKAGES += \
	mkdtimg

# Userdata Checkpointing OTA GC
PRODUCT_PACKAGES += \
	checkpoint_gc

# Vendor verbose logging default property
PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.verbose_logging_enabled=true
else
PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.verbose_logging_enabled=false
endif

# Touch
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

# Sensors
# MIDI feature
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml

-include hardware/google/pixel/power-libperfmgr/aidl/device.mk

# Audio HALs
#

# Audio HAL Server & Default Implementations
# Connectivity
PRODUCT_PACKAGES += \
        ConnectivityOverlay

# Storage health HAL
PRODUCT_PACKAGES += \
	android.hardware.health.storage-service.default

PRODUCT_PROPERTY_OVERRIDES += \
# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Enforce generic ramdisk allow list
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)

# WiFi
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
	frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
	frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml

	frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.concurrent.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.concurrent.xml \
	frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml\
	frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml\

	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \

PRODUCT_PROPERTY_OVERRIDES += \
	debug.slsi_platform=1 \
	debug.hwc.winupdate=1

PRODUCT_PROPERTY_OVERRIDES += \
	debug.sf.disable_backpressure=0 \
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.use_phase_offsets_as_durations=1
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.set_touch_timer_ms=200
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.set_display_power_timer_ms=1000
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.use_content_detection_for_refresh_rate=true
# Must align with HAL types Dataspace
# The data space of wide color gamut composition preference is Dataspace::DISPLAY_P3
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.wcg_composition_dataspace=143261696

# Display
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.has_wide_color_display=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.has_HDR_display=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.use_color_management=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.protected_contents=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.display_update_imminent_timeout_ms=50

PRODUCT_PROPERTY_OVERRIDES += \
# limit DPP downscale ratio
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += vendor.hwc.dpp.downscale=2

# Cannot reference variables defined in BoardConfig.mk, uncomment this if
# BOARD_USES_EXYNOS_AFBC_FEATURE is true
# set the dss enable status setup
PRODUCT_PROPERTY_OVERRIDES += \
	ro.vendor.ddk.set.afbc=1

PRODUCT_CHARACTERISTICS := nosdcard
endif

PRODUCT_PACKAGES += hostapd
PRODUCT_PACKAGES += wpa_supplicant
PRODUCT_PACKAGES += wpa_supplicant.conf

WIFI_PRIV_CMD_UPDATE_MBO_CELL_STATUS := enabled

# 1. Codec 2.0

PRODUCT_PROPERTY_OVERRIDES += \
       debug.c2.use_dmabufheaps=1 \
       media.c2.dmabuf.padding=512 \
       debug.stagefright.ccodec_delayed_params=1 \
       ro.vendor.gpu.dataspace=1

PRODUCT_PROPERTY_OVERRIDES += \
PRODUCT_PROPERTY_OVERRIDES += \
PRODUCT_PROPERTY_OVERRIDES += \
# 2. OpenMAX IL

# setup dalvik vm configs.
PRODUCT_TAGS += dalvik.gc.type-precise

# Trusty (KM, GK, Storage)
# Storage: for factory reset protection feature
PRODUCT_PROPERTY_OVERRIDES += \
	ro.frp.pst=/dev/block/by-name/frp

# System props to enable Bluetooth Quality Report (BQR) feature
PRODUCT_PRODUCT_PROPERTIES += \
	persist.bluetooth.bqr.min_interval_ms=500

PRODUCT_ENFORCE_RRO_TARGETS := \
	framework-res

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Use FUSE passthrough
PRODUCT_PRODUCT_PROPERTIES += \
	persist.sys.fuse.passthrough.enable=true

PRODUCT_PRODUCT_PROPERTIES += \
# Use /product/etc/fstab.postinstall to mount system_other
PRODUCT_PRODUCT_PROPERTIES += \
	ro.postinstall.fstab.prefix=/product

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/init/fstab.postinstall:$(TARGET_COPY_OUT_PRODUCT)/etc/fstab.postinstall

# fastbootd
PRODUCT_PACKAGES += \
	fastbootd

#google iwlan
PRODUCT_PACKAGES += \
	Iwlan

ifneq ($(BOARD_WITHOUT_RADIO),true)
# CP Logging properties
PRODUCT_PROPERTY_OVERRIDES += \
	ro.vendor.sys.modem.logging.loc = /data/vendor/slog \
	ro.vendor.cbd.modem_removable = "1" \
	ro.vendor.cbd.modem_type = "s5100sit" \
# Enable silent CP crash handling
PRODUCT_PROPERTY_OVERRIDES += \
# Add support dual SIM mode
PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.radio.multisim_switch_support=true

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

## Audio properties
PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.vc_call_vol_steps=7 \
	ro.audio.monitorRotation = true \
	ro.audio.offload_wakelock=false
else
PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.vc_call_vol_steps=7 \
	ro.config.media_vol_steps=25 \
	ro.audio.monitorRotation = true \
	ro.audio.offload_wakelock=false
endif

# vndservicemanager and vndservice no longer included in API 30+, however needed by vendor code.
# See b/148807371 for reference
PRODUCT_PACKAGES += vndservicemanager
PRODUCT_PACKAGES += vndservice

## Start packet router
# Thermal HAL
PRODUCT_PROPERTY_OVERRIDES += persist.vendor.enable.thermal.genl=true

# A/B support
PRODUCT_PACKAGES += \
	otapreopt_script \
	cppreopts.sh \
	update_engine \
	update_engine_sideload \
	update_verifier

# pKVM
$(call inherit-product, packages/modules/Virtualization/apex/product_packages.mk)
# Enable watchdog timeout loop breaker.
PRODUCT_PROPERTY_OVERRIDES += \
	framework_watchdog.fatal_window.second=600 \
	framework_watchdog.fatal_count=3

# Enable zygote critical window.
PRODUCT_PROPERTY_OVERRIDES += \
	zygote.critical_window.minute=10

# Suspend properties
PRODUCT_PROPERTY_OVERRIDES += \
# Enable Incremental on the device
PRODUCT_PROPERTY_OVERRIDES += \
	ro.incremental.enable=true

# Project
include hardware/google/pixel/common/pixel-common-device.mk

PRODUCT_PRODUCT_PROPERTIES += \
ifneq ($(BOARD_WITHOUT_RADIO),true)
# Telephony
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.carrierlock.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.carrierlock.xml
endif

# Set system properties identifying the chipset
PRODUCT_VENDOR_PROPERTIES += ro.soc.manufacturer=Google
PRODUCT_VENDOR_PROPERTIES += ro.soc.model=GS201

PRODUCT_PRODUCT_PROPERTIES += \
PRODUCT_PRODUCT_PROPERTIES += \
PRODUCT_PRODUCT_PROPERTIES += \
PRODUCT_PRODUCT_PROPERTIES += \
PRODUCT_PRODUCT_PROPERTIES += \
