//
//  DashBoardViewController.h
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


#import <UIKit/UIKit.h>

@interface DashBoardViewController : UIViewController
{
    IBOutlet UIButton *orgProfileBtn;
    IBOutlet UIButton *userProfileBtn;
    IBOutlet UIButton *aboutUsBtn;
    IBOutlet UIButton *forumBtn;
    IBOutlet UIButton *viewPostingsBtn;
    
}
@property (nonatomic, strong) IBOutlet UIButton *orgProfileBtn;
@property (nonatomic, strong) IBOutlet UIButton *userProfileBtn;
@property (nonatomic, strong) IBOutlet UIButton *aboutUsBtn;
@property (nonatomic, strong) IBOutlet UIButton *forumBtn;
@property (nonatomic, strong) IBOutlet UIButton *viewPostingsBtn;

@end
