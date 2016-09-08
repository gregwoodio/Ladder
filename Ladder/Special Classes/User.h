//
//  User.h
//  Ladder
//
//  Created by iOS Xcode User on 2016-04-11.
//  Copyright © 2016 Codebusters. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
{
    NSString *userID;
    NSString *username;
    NSString *firstName;
    NSString *lastName;
    NSString *email;
    NSString *userDescription;
    NSString *resume;
    NSInteger academicStatus;
    NSURL *pictureURL;
    NSString *timestamp;
}

@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *userDescription;
@property (nonatomic, strong) NSString *resume;
@property (nonatomic) NSInteger academicStatus;
@property (nonatomic, strong) NSURL *pictureURL;
@property (nonatomic, strong) NSString *timestamp;

@end
