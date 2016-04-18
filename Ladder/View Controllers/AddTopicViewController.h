//
//  AddTopicViewController.h
//  LadderTest
//
//  Created by iOS Xcode User on 2016-03-20.
//  Copyright © 2016 Greg Wood. All rights reserved.
//

/*
 Author: Greg Wood
 This is the header file for Add Topics view.
  */

#import <UIKit/UIKit.h>

@interface AddTopicViewController : UIViewController
{
    IBOutlet UITextField *txtUsername;
    IBOutlet UITextField *txtTopicName;
    IBOutlet UITextView *txtCommentBody;
}

@property (nonatomic, strong) IBOutlet UITextField *txtUsername;
@property (nonatomic, strong) IBOutlet UITextField *txtTopicName;
@property (nonatomic, strong) IBOutlet UITextView *txtCommentBody;

@end
