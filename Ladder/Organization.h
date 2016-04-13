//
//  Organization.h
//  Ladder
//
//  Created by iOS Xcode User on 2016-04-13.
//  Copyright © 2016 Codebusters. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Organization : NSObject
{
    NSInteger organizationID;
    NSString *username;
    NSString *organizationName;
    NSString *email;
    NSString *password;
    NSString *address;
    NSURL *url;
    NSURL *photo_url;
    NSString *missionStatement;
    NSDate *timestamp;
}
@property (nonatomic) NSInteger organizationID;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *organizationName;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSURL *photo_url;
@property (nonatomic, strong) NSString *missionStatement;
@property (nonatomic, strong) NSDate *timestamp;

@end
