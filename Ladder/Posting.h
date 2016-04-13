//
//  Posting.h
//  CodeBusters_PeterViews
//
//  Created by iOS Xcode User on 2016-04-13.
//  Copyright © 2016 Peter Phan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Posting : NSObject
{
    NSInteger postingID;
    NSString *jobTitle;
    NSString *organizerName;
    NSString *location;
    NSString *jobDescription;
}

@property (nonatomic) NSInteger postingID;
@property (nonatomic, strong) NSString *jobTitle;
@property (nonatomic, strong)NSString *organizerName;
@property (nonatomic, strong)NSString *location;
@property (nonatomic, strong)NSString *jobDescription;

-(id)initWithData:(NSString *)t theOrganizer:(NSString *)o theLocation:(NSString *)l theDescription:(NSString *)d;


@end
