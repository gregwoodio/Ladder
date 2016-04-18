//
//  DashBoardViewController.m
//  MajorProject
//
//  Created by Alan Simon on 2016-03-21.
//  Copyright © 2016 Sheridan College. All rights reserved.
//

/*
 Author: Alan Simon
 Description: This is the header file for the Dashboard View.
 This view will provide access to all other functions of the application.
 It will be treated like a root level controller.
 */


#import "DashBoardViewController.h"
#import "AppDelegate.h"

@interface DashBoardViewController ()

@end

@implementation DashBoardViewController
@synthesize orgProfileBtn, userProfileBtn, aboutUsBtn, viewPostingsBtn, forumBtn;

#pragma mark Navigation - Forward
/*
 Author: Alan Simon
 Description: This method will transition to the Topics view.
 
 */
-(IBAction)goToForums:(id)sender
{
    AppDelegate *mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [mainDelegate flipToTopics];
}

/*
 Author: Alan Simon
 Description: This method will transition to the Postings view.
 
 */
-(IBAction)goToPostings:(id)sender
{
    AppDelegate *mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [mainDelegate transToPostings];
}

/*
 Author: Alan Simon
 Description: This method will transition to the Organization view.
 
 */
-(IBAction)goToOrganizationProfile:(id)sender
{
    AppDelegate *mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [mainDelegate flipToOrgProfile];
}

/*
 Author: Alan Simon
 Description: This method will transition to the Profile view.
 
 */
-(IBAction)goToProfile:(id)sender
{
    AppDelegate *mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [mainDelegate flipToProfile];
}

/*
 Author: Alan Simon
 Description: This method will transition to the About Us view.
 
 */
-(IBAction)goToAbout:(id)sender
{
    AppDelegate *mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [mainDelegate transToAbout];
}

#pragma mark Navigation Backward
/*
 Author: Alan Simon
 Description: This method will transition back to the login page.
 Essentially logging out a user.
 
 */
-(IBAction)clickBack:(id)sender
{
    AppDelegate *mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [mainDelegate transToLogin];
}



#pragma mark Natural Functions

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
