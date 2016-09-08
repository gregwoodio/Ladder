//
//  UserUtility.h
//  Ladder
//
//  Created by iOS Xcode User on 2016-04-11.
//  Copyright © 2016 Codebusters. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Organization.h"

@interface UserUtility : NSObject {
    NSMutableData* responseData;
    User *user;
    Organization *org;
}
@property (nonatomic, strong) NSData *responseData;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) Organization *org;

- (User *) login: (NSString *)username pw:(NSString *)password;
- (User *) retrieveUser;
- (Organization *) retrieveOrganization: (NSString *)username pw:(NSString *)password;

@end
