//
//  Organization.h
//  Ladder
//
//  Created by iOS Xcode User on 2016-04-13.
//  Copyright © 2016 Codebusters. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Profile.h"

@interface Organization : Profile
{
    NSString *organizationName;
    NSString *address;
    NSURL *url;
    NSString *missionStatement;
}

@property (nonatomic, strong) NSString *organizationName;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSString *missionStatement;

@end
