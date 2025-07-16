TARGET := iphone:clang:latest:12.2


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = nezu-tweak

nezu-tweak_FILES = $(shell find Sources/nezu-tweak -name '*.swift') $(shell find Sources/nezu_tweakC -name '*.m' -o -name '*.c' -o -name '*.mm' -o -name '*.cpp')
nezu-tweak_SWIFTFLAGS = -ISources/nezu_tweakC/include
nezu-tweak_CFLAGS = -fobjc-arc -ISources/nezu_tweakC/include

include $(THEOS_MAKE_PATH)/tweak.mk
