//
//  DashBoardViewController.m
//  MajorProject
//
//  Created by Alan Simon on 2016-03-21.
//  Copyright © 2016 Sheridan College. All rights reserved.
//

#import "DashBoardViewController.h"
#import "AppDelegate.h"

@interface DashBoardViewController ()

@end

@implementation DashBoardViewController
@synthesize orgProfileBtn, userProfileBtn, aboutUsBtn, viewPostingsBtn, forumBtn;

-(IBAction)goToForums:(id)sender
{
    AppDelegate *mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [mainDelegate flipToTopics];
}


-(IBAction)goToOrganizationProfile:(id)sender
{
    AppDelegate *mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [mainDelegate flipToOrgProfile];
}


-(IBAction)goToProfile:(id)sender
{
    AppDelegate *mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [mainDelegate flipToProfile];
}

-(IBAction)goToAbout:(id)sender
{
    AppDelegate *mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [mainDelegate transToAbout];
}


-(IBAction)clickBack:(id)sender
{
    AppDelegate *mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [mainDelegate transToLogin];
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
