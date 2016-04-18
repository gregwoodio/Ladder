//
//  CommentsViewController.h
//  LadderTest
//
//  Created by iOS Xcode User on 2016-03-15.
//  Copyright © 2016 Greg Wood. All rights reserved.
//


/*
 Author: Greg Wood
    This is the header file for the Comments View
 */

#import <UIKit/UIKit.h>

@interface CommentsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UINavigationBar *navbar;
    IBOutlet UITableView *tblComments;
    NSArray *commentsArray;
    NSInteger *topicID;
    NSString *titleText;
}

@property (nonatomic, strong) IBOutlet UINavigationBar *navbar;
@property (nonatomic, strong) NSArray *commentsArray;
@property (nonatomic, strong) IBOutlet UITableView *tblComments;
@property (nonatomic) NSInteger *topicID;
@property (nonatomic, strong) NSString *titleText;

@end
