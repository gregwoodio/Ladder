//
//  ViewController.h
//  major_project
//
//  Created by iOS Xcode User on 2016-03-20.
//  Copyright © 2016 Muska Ahmadzai. All rights reserved.
//


/*
 Author: Muska Ahmadzai
 This is legacy code.
 
 */

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UIButton *loginBtn;
    IBOutlet UIButton *registerUserBtn;
    IBOutlet UIButton *registerOrgBtn;
    IBOutlet UITextField *txtUsername;
    IBOutlet UITextField *txtPassword;
}

@property (nonatomic, strong)IBOutlet UIButton *loginBtn;
@property (nonatomic, strong)IBOutlet UIButton *registerUserBtn;
@property (nonatomic, strong)IBOutlet UIButton *registerOrgBtn;
@property (nonatomic, strong) IBOutlet UITextField *txtUsername;
@property (nonatomic, strong) IBOutlet UITextField *txtPassword;

@end

