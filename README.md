# CleanCydia
Since Cydia relies on web views to show packages, this tweak scans for outgoing urls, references with a blocked list, and forbids ad requests.


### Core Logic

[CydiaWebViewController.xm](/CydiaWebViewController.xm)

```objective-c
%hook CydiaWebViewController

- (NSURLRequest *) webThreadWebView:(WebView *)view resource:(id)resource willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)response fromDataSource:(WebDataSource *)source {

  // see file above
  
}

%end
```


### Demo


| Before                                                                                                 | After                                                                                                  |
|--------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------|
| ![Error loading image.](https://raw.githubusercontent.com/ruslan120101/CleanCydia/master/images/4.png) | ![Error loading image.](https://raw.githubusercontent.com/ruslan120101/CleanCydia/master/images/3.png) |

![Error loading image.](https://raw.githubusercontent.com/ruslan120101/CleanCydia/master/images/1.png)

![Error loading image.](https://raw.githubusercontent.com/ruslan120101/CleanCydia/master/images/2.png)
