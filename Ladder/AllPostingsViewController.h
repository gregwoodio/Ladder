//
//  AllPostingsViewController.h
//  Ladder
//
//  Created by iOS Xcode User on 2016-04-13.
//  Copyright © 2016 Codebusters. All rights reserved.
//



/*  Author : Peter
 *  Creates and Binds a TableView to AllPostingsVC
 *  
 */


#import <UIKit/UIKit.h>

@interface AllPostingsViewController : UIViewController  <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *tableView;
}
@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end


