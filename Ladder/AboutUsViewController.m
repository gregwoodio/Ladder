//
//  AboutUsViewController.m
//  MajorProject
//
//  Created by Alan Simon on 2016-03-22.
//  Copyright © 2016 Sheridan College. All rights reserved.
//


/*
 Author: Alan Simon
 Description: This is the m file for the About Us View.
 The file will load the website and stop the activity indicator when completed.
 
 */

#import "AboutUsViewController.h"
#import "AppDelegate.h"
@interface AboutUsViewController ()

@end

@implementation AboutUsViewController
@synthesize webView, activity;


#pragma mark App Methods
/*
 Author: Alan Simon
 Description: This method will only run when the webview starts loading, to start the indicator and allow it to appear
 
 */

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [activity setHidden:NO];
    [activity startAnimating];
}

/*
 Author: Alan Simon
 Description: This method will only run when the webview stops loading, to stop the indicator and allow it to disappear
 
 */

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activity setHidden:YES];
    [activity stopAnimating];
}



/*
 Author: Alan Simon
 Description: This method will invoke when the view is created, and will assigned a URL to the webview to load.
 
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //AppDelegate *mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    NSURL *URLaddress = [NSURL URLWithString:@"https://www.littlegiantladder.com/"];
    NSURLRequest *url = [NSURLRequest requestWithURL:URLaddress];
    
    [webView loadRequest:url];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

-(IBAction)clickBack:(id)sender
{
    AppDelegate *mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [mainDelegate transToDashFromAbout];
}

@end
