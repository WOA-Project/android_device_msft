ifneq ($(filter cityman, $(TARGET_DEVICE)),)

IMAGE_GZ := device/msft/cityman/prebuilt-kernel/android-$(TARGET_KERNEL_USE)/Image.gz
DTB := device/msft/cityman/prebuilt-kernel/android-$(TARGET_KERNEL_USE)/msm8994-cityman.dtb

$(PRODUCT_OUT)/kernel: $(IMAGE_GZ) $(DTB)
	cat $(IMAGE_GZ) $(DTB) > $@

droidcore: $(PRODUCT_OUT)/kernel

endif
