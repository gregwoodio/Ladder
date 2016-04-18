//
//  OrganizationProfileViewController.m
//  major_project
//
//  Created by iOS Xcode User on 2016-03-25.
//  Copyright © 2016 Muska Ahmadzai. All rights reserved.
//


/*
 Author: Alan Simon
 Description: This is the header file for the About Us View.
 
 */


#import "OrganizationProfileViewController.h"
#import "AppDelegate.h"

@interface OrganizationProfileViewController ()

@end

@implementation OrganizationProfileViewController
@synthesize lbAddress,lbWebsite,lbMissionStatement,lbOrganizationName,imgProfilePicture, organization;

-(IBAction)goHome:(id)sender
{
    AppDelegate *mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [mainDelegate flipToOrgProfileHome];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    lbAddress.text = organization.address;
//    lbWebsite.text = organization.url;
    lbMissionStatement.text = organization.missionStatement;
    lbOrganizationName.text = organization.organizationName;
//    imgProfilePicture.image = [[UIImage ]]
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
