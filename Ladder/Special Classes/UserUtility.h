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
    User *user;
    Organization *org;
}
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) Organization *org;

- (Profile *) login: (NSString *)username pw:(NSString *)password;
- (Profile *) retrieveProfile;

@end
