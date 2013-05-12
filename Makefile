export ARCHS=armv7

include theos/makefiles/common.mk

TARGET_IPHONEOS_DEPLOYMENT_VERSION = 6.0
TARGET_CC = xcrun -sdk iphoneos clang 
TARGET_CXX = xcrun -sdk iphoneos clang++
TARGET_LD = xcrun -sdk iphoneos clang++
ADDITIONAL_OBJCFLAGS = -fobjc-arc

TWEAK_NAME = HoldToOpen
HoldToOpen_FILES = Tweak.xm
HoldToOpen_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
