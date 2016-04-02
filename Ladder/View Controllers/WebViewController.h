//
//  WebViewController.h
//  LadderTest
//
//  Created by iOS Xcode User on 2016-03-20.
//  Copyright © 2016 Greg Wood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate>
{
    IBOutlet UIWebView *webView;
    IBOutlet UIActivityIndicatorView *activity;
    UIView *sentFrom;
    NSString *url;
}

@property (nonatomic, strong) IBOutlet UIWebView *webView;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activity;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) UIView *sentFrom;

@end
