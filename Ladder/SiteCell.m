//
//  SiteCell.m
//  NibsAndTables2
//
//  Created by iOS Xcode User on 2016-03-22.
//  Copyright © 2016 Peter Phan. All rights reserved.
//

#import "SiteCell.h"

@implementation SiteCell

@synthesize primaryLabel, secondaryLabel;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        primaryLabel = [[UILabel alloc] init];
        primaryLabel.textAlignment = NSTextAlignmentLeft;
        primaryLabel.font = [UIFont systemFontOfSize:18];
        primaryLabel.backgroundColor = [UIColor clearColor];
        primaryLabel.textColor = [UIColor blackColor];
        
        secondaryLabel = [[UILabel alloc] init];
        secondaryLabel.textAlignment = NSTextAlignmentLeft;
        secondaryLabel.font = [UIFont systemFontOfSize:12];
        secondaryLabel.backgroundColor = [UIColor clearColor];
        secondaryLabel.textColor = [UIColor blueColor];
        
        
        [self.contentView addSubview:primaryLabel];
        [self.contentView addSubview:secondaryLabel];

    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGRect frame;

    
    frame = CGRectMake(5, 5, 260, 20);
    primaryLabel.frame = frame;
    
    frame = CGRectMake(5, 30, 260, 20);
    secondaryLabel.frame = frame;
}

-(void)awakeFromNib {
    
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
