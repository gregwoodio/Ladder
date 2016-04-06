//
//  RegisterViewController.m
//  major_project
//
//  Created by iOS Xcode User on 2016-03-20.
//  Copyright © 2016 Muska Ahmadzai. All rights reserved.
//

#import "RegisterViewController.h"
#import "ProfileViewController.h"
#import "AppDelegate.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

@synthesize txtDescription,txtEmail,txtFirstName,txtLastName,txtPassword,txtResume,imgProfilePicture, sgAcademicStatus, txtPicturePath;



-(IBAction)goHome:(id)sender
{
    AppDelegate *mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [mainDelegate flipToRegisterHome];
}

-(IBAction)goProfile:(id)sender
{
    AppDelegate *mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [mainDelegate flipToProfile];
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
    NSString *post = [NSString stringWithFormat:@"FirstName=%@&LastName=%@&Password=%@&Email=%@&Description=%@&Resume=%@&AcademicStatus=%@&Picture=%@",
                      txtFirstName.text,
                      txtLastName.text,
                      txtPassword.text,
                      txtEmail.text,
                      txtDescription.text,
                      txtResume.text,
                      @"Not Available",
                      txtPicturePath.text];
    
    //Encode String
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    //Need post length
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long) [postData length]];
    
    //make URL request
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] init];
    [req setURL: [NSURL URLWithString: @"http://mobile.sheridanc.on.ca/~woodgre/AddUser.php"]];
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
        
        //Pass user details on to Profile View Controller.
        
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
