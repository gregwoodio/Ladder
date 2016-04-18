//
//  AboutUsViewController.h
//  MajorProject
//
//  Created by Alan Simon on 2016-03-22.
//  Copyright © 2016 Sheridan College. All rights reserved.
//

/*
    Author: Alan Simon
    Description: This is the header file for the About Us View.
 
 */



#import <UIKit/UIKit.h>

@interface AboutUsViewController : UIViewController <UIWebViewDelegate>
{
    IBOutlet UIWebView *webView;
    IBOutlet UIActivityIndicatorView *activity;
}
@property (nonatomic, strong) IBOutlet UIWebView *webView;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activity;

@end
