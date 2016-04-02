//
//  CommentTableViewCell.h
//  LadderTest
//
//  Created by iOS Xcode User on 2016-03-17.
//  Copyright © 2016 Greg Wood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentTableViewCell : UITableViewCell
{
    IBOutlet UILabel *author;
    IBOutlet UILabel *body;
    IBOutlet UIImageView *avatar;
}
@property (nonatomic, strong) IBOutlet UILabel *author;
@property (nonatomic, strong) IBOutlet UILabel *body;
@property (nonatomic, strong) IBOutlet UIImageView *avatar;

@end
