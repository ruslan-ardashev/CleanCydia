include theos/makefiles/common.mk

BUNDLE_NAME = CleanCydiaPrefs
CleanCydiaPrefs_FILES = CleanCydiaPrefs.mm
CleanCydiaPrefs_INSTALL_PATH = /Library/PreferenceBundles
CleanCydiaPrefs_FRAMEWORKS = UIKit
CleanCydiaPrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/CleanCydiaPrefs.plist$(ECHO_END)
