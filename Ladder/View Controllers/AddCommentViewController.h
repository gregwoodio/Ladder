//
//  AddCommentViewController.h
//  LadderTest
//
//  Created by iOS Xcode User on 2016-03-20.
//  Copyright © 2016 Greg Wood. All rights reserved.
//


/*
 Author: Greg Wood
 Description: This is the header file for the Add Comment View.
 It requires a username, comment as well as a id and title.
 
 */

#import <UIKit/UIKit.h>

@interface AddCommentViewController : UIViewController
{
    IBOutlet UITextField *txtUsername;
    IBOutlet UITextView *txtCommentBody;
    IBOutlet UILabel *lblTitle;
    NSString *topicID;
    NSString *topicTitle;
}

@property (nonatomic, strong) IBOutlet UITextField *txtUsername;
@property (nonatomic, strong) IBOutlet UITextView *txtCommentBody;
@property (nonatomic, strong) IBOutlet UILabel *lblTitle;
@property (nonatomic, strong) NSString *topicID;
@property (nonatomic, strong) NSString *topicTitle;

@end
