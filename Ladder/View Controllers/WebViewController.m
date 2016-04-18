//
//  WebViewController.m
//  LadderTest
//
//  Created by iOS Xcode User on 2016-03-20.
//  Copyright © 2016 Greg Wood. All rights reserved.
//


/*
    Author: Greg Wood
 
 
 
 */

#import "WebViewController.h"
#import "AppDelegate.h"

@interface WebViewController ()

@end

@implementation WebViewController

@synthesize webView, activity, sentFrom, url;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [webView loadRequest:req];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Web View methods

/*
 Author: Greg Wood
 
 
 
 */

- (void) webViewDidStartLoad:(UIWebView *)webView {
    [activity startAnimating];
    [activity setHidden: NO];
}

/*
 Author: Greg Wood
 
 
 
 */

- (void) webViewDidFinishLoad:(UIWebView *)webView {
    [activity stopAnimating];
    [activity setHidden:YES];
}

/*
 Author: Greg Wood
 
 
 
 */

- (IBAction)returnToSender:(id)sender {
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [mainDelegate setupAnimation:BACKWARD];
    [mainDelegate swapViews:mainDelegate.webVC.view goingTo:sentFrom];
    mainDelegate.webVC = nil;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
