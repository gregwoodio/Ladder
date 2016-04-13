//
//  SiteCell.h
//  NibsAndTables2
//
//  Created by iOS Xcode User on 2016-03-22.
//  Copyright © 2016 Peter Phan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SiteCell : UITableViewCell
{
    UILabel *primaryLabel;
    UILabel *secondaryLabel;

}

@property (nonatomic, strong)UILabel *primaryLabel;
@property (nonatomic, strong)UILabel *secondaryLabel;
@end
