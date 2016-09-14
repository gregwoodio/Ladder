//
//  OrganizationRegisterViewController.m
//  major_project
//
//  Created by iOS Xcode User on 2016-03-25.
//  Copyright © 2016 Muska Ahmadzai. All rights reserved.
//


/*
 Author: Muska Ahmadzai
 
 
 
 */

#import "OrganizationRegisterViewController.h"
#import "AppDelegate.h"
#import "OrganizationProfileViewController.h" 

@interface OrganizationRegisterViewController ()

@end

@implementation OrganizationRegisterViewController
@synthesize txtAddress,txtEmail,txtMissionStatement,txtOrganizationName,txtPassword,txtWebsite,imgProfilePicture, txtPicturePath;


-(IBAction)goHome:(id)sender
{
    AppDelegate *mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [mainDelegate flipToOrgRegisterHome];
}

-(IBAction)goProfile:(id)sender
{
    AppDelegate *mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [mainDelegate flipToOrgProfile];
    
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

#pragma mark - Add User method

-(IBAction)addUser:(id)sender{
    //make the POST string
    //TODO: Add username text field to Organization registration view
    NSString *post = [NSString stringWithFormat:@"Username=%@&Email=%@&Password=%@&Picture=%@&OrganizationName=%@&Address=%@&URL=%@&MissionStatement=%@",
                      txtOrganizationName.text,
                      txtEmail.text,
                      txtPassword.text,
                      txtPicturePath.text,
                      txtOrganizationName.text,
                      txtAddress.text,
                      txtWebsite.text,
                      txtMissionStatement.text];
    
    //Encode String
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    //Need post length
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long) [postData length]];
    
    //make URL request
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] init];
    [req setURL: [NSURL URLWithString: @"http://laddr.xyz/api/organization"]];
    [req setHTTPMethod:@"POST"];
    [req setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [req setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [req setHTTPBody: postData];
    
    //Make a URLConnection
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    
    //Successful connection:show message and to UserProfile
    if(conn) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Success" message:@"You are now a registered user." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                   handler: ^(UIAlertAction *action) {
                                                       //[alert dismissViewControllerAnimated:YES completion:nil];
                                                       [self goProfile:nil];
                                                   }];
        [alert addAction:ok];
        
        [self presentViewController:alert animated: YES completion:nil];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Failure." message:@"Registration was not successful. Check your internet connection, or try again later." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                   handler: ^(UIAlertAction *action) {
                                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                                   }];
        [alert addAction:ok];
        
        [self presentViewController:alert animated: YES completion:nil];
    }

    
    
                            
}

@end
