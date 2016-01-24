#import <Preferences/Preferences.h>

@interface CleanCydiaPrefsListController: PSListController {
}
@end

@implementation CleanCydiaPrefsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"CleanCydiaPrefs" target:self] retain];
	}
	return _specifiers;
}
-(void) sendEmail {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:ardashev120101@gmail.com?subject=CleanCydia"]];
}

-(void) openiDevYoutubeChannel {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.youtube.com/channel/UC2GzUE7JdXrD_HlVMg9_c6A"]];
}

-(void) showCydiaPackagePanicLock9 {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"cydia://package/org.thebigboss.paniclock9"]];
}

-(void) showCydiaPackageWhitelistSwitcher9 {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"cydia://package/org.thebigboss.whitelistswitcher9"]];
}

-(void) showCydiaPackageBlacklistSwitcher9 {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"cydia://package/org.thebigboss.blacklistswitcher9"]];
}

@end

// vim:ft=objc
