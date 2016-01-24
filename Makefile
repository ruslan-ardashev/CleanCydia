GO_EASY_ON_ME = 1
TARGET = iphone:latest:9.0
ARCHS = armv7 armv7s arm64
THEOS_BUILD_DIR = Packages

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CleanCydia
CleanCydia_FRAMEWORKS = Foundation UIKit
CleanCydia_FILES = CleanCydiaData.xm CydiaWebViewController.xm

CleanCydia_CFLAGS = -fobjc-arc
CleanCydia_LDFLAGS += -Wl,-segalign,4000

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += cleancydiaprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
