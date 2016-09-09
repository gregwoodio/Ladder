//
//  Profile.h
//  Laddr
//
//  Copyright © 2016 Codebusters. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Profile : NSObject
{
    NSString *profileID;
    NSString *username;
    NSString *email;
    NSString *password;
    NSURL *pictureURL;
    NSDate *timestamp;
}
@property (nonatomic, strong) NSString *profileID;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSURL *pictureURL;
@property (nonatomic, strong) NSDate *timestamp;

@end
