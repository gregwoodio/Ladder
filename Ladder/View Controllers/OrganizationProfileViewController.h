//
//  OrganizationProfileViewController.h
//  major_project
//
//  Created by iOS Xcode User on 2016-03-25.
//  Copyright © 2016 Muska Ahmadzai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Organization.h"

@interface OrganizationProfileViewController : UIViewController
{
    //Basic Profile
    IBOutlet UILabel *lbWebsite;
    IBOutlet UIImageView *imgProfilePicture;

    //Organization
    IBOutlet UILabel *lbOrganizationName;
    IBOutlet UITextView *lbAddress;
    IBOutlet UITextView *lbMissionStatement;
    Organization *organization;

}
@property (strong, nonatomic) IBOutlet UILabel *lbWebsite;
@property (strong, nonatomic) IBOutlet UIImageView *imgProfilePicture;

@property (strong, nonatomic) IBOutlet UILabel *lbOrganizationName;
@property (strong, nonatomic) IBOutlet UITextView *lbAddress;
@property (strong, nonatomic) IBOutlet UITextView *lbMissionStatement;

@property (nonatomic, strong) Organization *organization;

@end
