//
//  AboutUsViewController.m
//  MajorProject
//
//  Created by Alan Simon on 2016-03-22.
//  Copyright © 2016 Sheridan College. All rights reserved.
//

#import "AboutUsViewController.h"
#import "AppDelegate.h"
@interface AboutUsViewController ()

@end

@implementation AboutUsViewController
@synthesize webView, activity;


-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [activity setHidden:NO];
    [activity startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activity setHidden:YES];
    [activity stopAnimating];
}

-(IBAction)clickBack:(id)sender
{
    AppDelegate *mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [mainDelegate transToDashFromAbout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //AppDelegate *mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    NSURL *URLaddress = [NSURL URLWithString:@"https://reddit.com/r/batman"];
    NSURLRequest *url = [NSURLRequest requestWithURL:URLaddress];
    
    [webView loadRequest:url];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
