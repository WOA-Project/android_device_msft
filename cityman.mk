ifndef TARGET_KERNEL_USE
TARGET_KERNEL_USE := 5.4
endif

KERNEL_MODS := $(wildcard device/msft/cityman/prebuilt-kernel/android-$(TARGET_KERNEL_USE)/*.ko)

# Following modules go to vendor partition
# msm.ko is too big (31M) for ramdisk
VENDOR_KERN_MODS := %/msm.ko
BOARD_VENDOR_KERNEL_MODULES := $(filter $(VENDOR_KERN_MODS),$(KERNEL_MODS))

# All other modules go to ramdisk
BOARD_GENERIC_RAMDISK_KERNEL_MODULES := $(filter-out $(VENDOR_KERN_MODS),$(KERNEL_MODS))

# Inherit the full_base and device configurations
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, device/msft/cityman/cityman/device.mk)
$(call inherit-product, device/msft/cityman/device-common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Product overrides
PRODUCT_BRAND := MicrosoftMobile
PRODUCT_NAME := cityman
PRODUCT_MANUFACTURER := MicrosoftMobile
PRODUCT_DEVICE := cityman
PRODUCT_MODEL := Lumia 950 XL
