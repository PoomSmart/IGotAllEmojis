TARGET := iphone:clang:latest:9.0
PACKAGE_VERSION = 1.0.1
ARCHS = armv7 arm64
INSTALL_TARGET_PROCESSES = Instagram Facebook

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = IGotAllEmojis

IGotAllEmojis_FILES = Tweak.x
IGotAllEmojis_CFLAGS = -fobjc-arc
IGotAllEmojis_LIBRARIES = EmojiLibrary

include $(THEOS_MAKE_PATH)/tweak.mk
