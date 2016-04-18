//
//  TopicsViewController.h
//  LadderTest
//
//  Created by iOS Xcode User on 2016-03-15.
//  Copyright © 2016 Greg Wood. All rights reserved.
//

/*
 Author: Greg Wood
 
 
 
 */

#import <UIKit/UIKit.h>
#import "CommentsViewController.h"

@interface TopicsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSArray *topics;
    IBOutlet UITableView *tblTopics;
}
@property (nonatomic, strong) NSArray *topics;
@property (nonatomic, strong) IBOutlet UITableView *tblTopics;

@end
