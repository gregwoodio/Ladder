//
//  RegisterViewController.h
//  major_project
//
//  Created by iOS Xcode User on 2016-03-20.
//  Copyright © 2016 Muska Ahmadzai. All rights reserved.
//


/*
 Author: Muska Ahmadzai
 
 
 
 */

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController
{
    
    //Register Account Fields
    IBOutlet UITextField *txtPassword;
    IBOutlet UITextField *txtEmail;
    IBOutlet UITextField *txtPicturePath;
    
    //Profile Fields
    IBOutlet UITextView *txtDescription;
    IBOutlet UIImagePickerController *imgProfilePicture;
    
    //User Profile Fields
    IBOutlet UITextField *txtUsername;
    IBOutlet UITextField *txtFirstName;
    IBOutlet UITextField *txtLastName;
    IBOutlet UITextView *txtResume;
    IBOutlet UISegmentedControl *sgAcademicStatus;
    
}
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong,nonatomic) IBOutlet UITextField *txtPicturePath;

@property (strong, nonatomic) IBOutlet UITextView *txtDescription;
@property (strong, nonatomic) IBOutlet UIImagePickerController *imgProfilePicture;

@property (nonatomic, strong) IBOutlet UITextField *txtUsername;
@property (strong, nonatomic) IBOutlet UITextField *txtFirstName;
@property (strong, nonatomic) IBOutlet UITextField *txtLastName;
@property (strong, nonatomic) IBOutlet UITextView *txtResume;
@property (strong, nonatomic) IBOutlet UISegmentedControl *sgAcademicStatus;


@end
