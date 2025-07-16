ifeq ($(THEOS_PACKAGE_SCHEME),rootless)
	TARGET := iphone:clang:latest:15.0
else
	TARGET := iphone:clang:latest:12.2
endif

export THEOS = $(HOME)/theos
export USE_ORION = 1
export ORION_EMBED_FRAMEWORK = 1
export ORION_FRAMEWORK_PATH = $(shell pwd)/Orion_1.0.2
export USE_SUBSTRATE = 0  # Substrate のリンカーエラーを防ぐ（Orion 使用時は通常不要）

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = nezutweak

nezutweak_FILES = $(shell find Sources/nezutweak -name '*.swift')
nezutweak_SWIFTFLAGS =
nezutweak_CFLAGS =

include $(THEOS)/makefiles/tweak.mk
