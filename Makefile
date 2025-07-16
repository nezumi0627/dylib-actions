TARGET := iphone:clang:latest:12.2
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = nezu_tweak

nezu_tweak_FILES = \
  $(shell find Sources/nezu_tweak -name '*.swift') \
  $(shell find Sources/nezu_tweakC -name '*.m' -o -name '*.c' -o -name '*.mm' -o -name '*.cpp')

nezu_tweak_SWIFTFLAGS = -ISources/nezu_tweakC/include
nezu_tweak_CFLAGS = -fobjc-arc -ISources/nezu_tweakC/include

USE_ORION = 1

export ORION_EMBED_FRAMEWORK = 1

include $(THEOS_MAKE_PATH)/tweak.mk
