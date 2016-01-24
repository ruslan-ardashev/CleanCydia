////////////////////////////////////////////////////////////////////////////////////////////
//
// CleanCydia by Ruslan Ardashev 
// ardashev120101@gmail.com
// www.ruslanArdashev.com
// Copyright 2016
//
////////////////////////////////////////////////////////////////////////////////////////////

@interface CleanCydiaData: NSObject
+ (BOOL)IsEnabled;
@end

// Static Vars
static NSUserDefaults *Preferences;

static void LoadPreferences() {

    Preferences = [[NSUserDefaults alloc] initWithSuiteName:@"com.ruslan.cleancydiaprefs"];

    [Preferences registerDefaults:@{
        @"enabled" : @true
    }];

}

@implementation CleanCydiaData

+ (void)load {

    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                NULL,
                                (CFNotificationCallback)LoadPreferences,
                                CFSTR("com.ruslan.cleancydiaprefs/prefsChanged"),
                                NULL,
                                CFNotificationSuspensionBehaviorDeliverImmediately);
    LoadPreferences();

}

+ (BOOL)IsEnabled { 

    return [Preferences boolForKey:@"enabled"]; 

}

@end
