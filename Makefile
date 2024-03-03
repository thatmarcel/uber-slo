ARCHS = arm64
TARGET := iphone:clang:latest:15.0

INSTALL_TARGET_PROCESSES = Carbon

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = UberSlo

UberSlo_FILES = Tweak.x
UberSlo_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
