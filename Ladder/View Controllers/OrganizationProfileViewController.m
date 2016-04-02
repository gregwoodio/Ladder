//
//  OrganizationProfileViewController.m
//  major_project
//
//  Created by iOS Xcode User on 2016-03-25.
//  Copyright © 2016 Muska Ahmadzai. All rights reserved.
//

#import "OrganizationProfileViewController.h"
#import "AppDelegate.h"

@interface OrganizationProfileViewController ()

@end

@implementation OrganizationProfileViewController
@synthesize lbAddress,lbWebsite,lbMissionStatement,lbOrganizationName,imgProfilePicture;

-(IBAction)goHome:(id)sender
{
    AppDelegate *mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [mainDelegate flipToOrgProfileHome];
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
