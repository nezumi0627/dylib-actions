ARCHS = armv7 arm64

INSTALL_TARGET_PROCESSES = LINE
export SDKVERSION = 11.2

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = test

test_FILES = Tweak.x
test_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
