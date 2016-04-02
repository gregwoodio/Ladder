//
//  OrganizationRegisterViewController.h
//  major_project
//
//  Created by iOS Xcode User on 2016-03-25.
//  Copyright © 2016 Muska Ahmadzai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrganizationRegisterViewController : UIViewController
{
    //Register Account Fields
    IBOutlet UITextField *txtPassword;
    IBOutlet UITextField *txtEmail;
    IBOutlet UITextField *txtPicturePath;

    //Profile Fields
    IBOutlet UITextField *txtWebsite;
    IBOutlet UIImagePickerController *imgProfilePicture;

    //Organization Profile Fields
    IBOutlet UITextField *txtOrganizationName;
    IBOutlet UITextView *txtAddress;
    IBOutlet UITextView *txtMissionStatement;
}


@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtPicturePath;

@property (strong, nonatomic) IBOutlet UITextField *txtWebsite;
@property (strong, nonatomic) IBOutlet UIImagePickerController *imgProfilePicture;


@property (strong, nonatomic) IBOutlet UITextField *txtOrganizationName;
@property (strong, nonatomic) IBOutlet UITextView *txtAddress;
@property (strong, nonatomic) IBOutlet UITextView *txtMissionStatement;


@end
