////////////////////////////////////////////////////////////////////////////////////////////
//
// CleanCydia by Ruslan Ardashev 
// ardashev120101@gmail.com
// www.ruslanArdashev.com
// Copyright 2016
//
////////////////////////////////////////////////////////////////////////////////////////////

#include "Foundation/Foundation.h"
#include "UIKit/UIKit.h"

#define FILTERED_DOMAINS [@"https://ssl.google-analytics", @"https://www.google-analytics", @"http://www.google-analytics", @"https://googleads", @"http://go.pad", @"http://padsdel", @"http://bank-100.ads", @"http://cdn", @"http://s0", @"http://pagead2", @"http://partnercreative", @"http://ib.adnxs", @"http://click.sovrn", @"http://servedby", @"http://cm.g.", @"https://dt.adsafeprotected", @"http://tags.", @"http://www.googletagservices", @"http://partner.googleadservices", @"http://tpc.googlesyndication", @"https://securepubads", @"http://tags.", @"http://a.", @"https://tpc.", @"https://gum.criteo", @"http://mathid.mathtag", @"http://pubservcdn", @"http://ads.", @"http://banners.itunes.", @"http://static.", @"http://c2s.", @"http://www.trackimpression", @"http://dts.akamai", @"http://images.startappservice", @"http://edge.", @"http://p.vibrant.co", @"http://b.", @"http://pixel.", @"http://ads.", @"http://vap2iad1.", @"http://clickcdn"]

// @"http://js.casalemedia", @"http://as.casalemedia", @"http://dsum.casalemedia", @"http://pixel.", @"http://edge.", @"http://js.revsci.", @"http://pippio", @"http://ap.", , @"http://gslbeacon.", @"http://track2.", @"http://idsync.", @"http://bcp", @"http://s.", @"http://ds."

// modmyi @"http://ajax.",

@class WebDataSource;

@interface WebView: UIView
@end

@interface CydiaWebViewController: NSObject
- (NSURLRequest *) webThreadWebView:(WebView *)view resource:(id)resource willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)response fromDataSource:(WebDataSource *)source;
@end

@interface CleanCydiaData: NSObject
+(BOOL)IsEnabled;
@end

%hook CydiaWebViewController

- (NSURLRequest *) webThreadWebView:(WebView *)view resource:(id)resource willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)response fromDataSource:(WebDataSource *)source {

	if ([CleanCydiaData IsEnabled]) {

		// NSLog(@"Ruslan: webThreadWebView.");

		NSURL *url = [request URL];
		NSString *string = url.absoluteString;

		NSArray *filteredDomains = @FILTERED_DOMAINS;
		Boolean found = false;

		for (NSString *domain in filteredDomains) {

			if ([string hasPrefix:domain]) {

				// NSLog(@"Found %@", string);
				found = true;

			}

		}

		return found ? nil : %orig;

	} else {

		return %orig;

	}

}

%end


	// - (NSURLRequest *) webView:(WebView *)view resource:(id)resource willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)response fromDataSource:(WebDataSource *)source {

	// 	NSLog(@"Ruslan: CydiaWebViewController: \nwebView: %@\nresource: %@\nwillSendRequest: %@\nredirectResponse: %@\nfromDataSource: %@", view, resource, request, response, source);
	// 	return %orig;

	// }
