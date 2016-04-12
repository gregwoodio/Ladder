//
//  ProfileViewController.h
//  major_project
//
//  Created by iOS Xcode User on 2016-03-20.
//  Copyright © 2016 Muska Ahmadzai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"

@interface ProfileViewController : UIViewController
{
    //Basic Class
    IBOutlet UITextView *lbDescription;
    IBOutlet UIImageView *imgProfilePicture;
    IBOutlet UILabel *lbEmail;
    
    //User Profile
    IBOutlet UILabel *lbFirstName;
    IBOutlet UILabel *lbLastName;
    IBOutlet UILabel *lbAcademicStatus;
    IBOutlet UITextView *lbResume;
    
}

@property (strong, nonatomic) IBOutlet UITextView *lbDescription;
@property (strong, nonatomic) IBOutlet UIImageView *imgProfilePicture;
@property (strong, nonatomic) IBOutlet UILabel *lbEmail;

@property (strong, nonatomic) IBOutlet UILabel *lbFirstName;
@property (strong, nonatomic) IBOutlet UILabel *lbLastName;
@property (strong, nonatomic) IBOutlet UILabel *lbAcademicStatus;
@property (strong, nonatomic) IBOutlet UITextView *lbResume;

@end
