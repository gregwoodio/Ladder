//
//  RegisterViewController.m
//  major_project
//
//  Created by iOS Xcode User on 2016-03-20.
//  Copyright © 2016 Muska Ahmadzai. All rights reserved.
//

/*
 Author: Muska Ahmadzai
 
 
 
 */

#import "RegisterViewController.h"
#import "ProfileViewController.h"
#import "AppDelegate.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

@synthesize txtUsername, txtDescription,txtEmail,txtFirstName,txtLastName,txtPassword,txtResume,imgProfilePicture, sgAcademicStatus, txtPicturePath;


/*
 Author: Muska Ahmadzai
 
 
 
 */
-(IBAction)goHome:(id)sender
{
    AppDelegate *mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [mainDelegate flipToRegisterHome];
}

/*
 Author: Muska Ahmadzai
 
 
 
 */
-(IBAction)goProfile:(id)sender
{
    AppDelegate *mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [mainDelegate flipToProfile];
}

/*
 Author: Muska Ahmadzai
 
 
 
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


/*
 Author: Muska Ahmadzai
 
 
 
 */
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


/*
 Author: Greg Wood
 
 
 
 */
-(IBAction)addUser:(id)sender{
    //make the POST string
    //Username, Email, Password, PictureURL, FirstName, LastName, Description, and Resume
    NSString *post = [NSString stringWithFormat:@"Username=%@&Email=%@&Password=%@&PictureURL=%@&FirstName=%@&LastName=%@&Description=%@&Resume=%@",
                      txtUsername.text,
                      txtEmail.text,
                      txtPassword.text,
                      txtPicturePath.text,
                      txtFirstName.text,
                      txtLastName.text,
                      txtDescription.text,
                      txtResume.text];

    //Encode String
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    //Need post length
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long) [postData length]];
    
    //make URL request
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] init];
    [req setURL: [NSURL URLWithString: @"http://laddr.xyz/api/user"]];
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
                                                       AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                                                       [delegate loginUser:txtUsername.text pw:txtPassword.text
                                                        ];                                                       [self goProfile:nil];
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
