TARGET := iphone:clang:latest:12.2


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = nezutweak

nezutweak_FILES = $(shell find Sources/nezutweak -name '*.swift') $(shell find Sources/nezutweakC -name '*.m' -o -name '*.c' -o -name '*.mm' -o -name '*.cpp')
nezutweak_SWIFTFLAGS = -ISources/nezutweakC/include
nezutweak_CFLAGS = -fobjc-arc -ISources/nezutweakC/include

include $(THEOS_MAKE_PATH)/tweak.mk
