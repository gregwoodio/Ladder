//
//  CreatePostingsViewController.h
//  CodeBusters_PeterViews
//
//  Created by iOS Xcode User on 2016-03-20.
//  Copyright © 2016 Peter Phan. All rights reserved.
//

/*
 Author: Peter Phan
 Description: 
 
 */


#import <UIKit/UIKit.h>

@interface CreatePostingsViewController : UIViewController
{
    IBOutlet UITextField *txtTitle;
    IBOutlet UITextField *txtOrganizer;
    IBOutlet UITextField *txtLocation;
    IBOutlet UITextView *txtDescription;

}

@property (nonatomic, strong) IBOutlet UITextField *txtTitle;
@property (nonatomic, strong) IBOutlet UITextField *txtOrganizer;
@property (nonatomic, strong) IBOutlet UITextField *txtLocation;
@property (nonatomic, strong) IBOutlet UITextView *txtDescription;

@end
