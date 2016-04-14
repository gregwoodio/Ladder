//
//  UserUtility.h
//  Ladder
//
//  Created by iOS Xcode User on 2016-04-11.
//  Copyright © 2016 Codebusters. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface UserUtility : NSObject {
    NSMutableData* responseData;
    User *user;
}
@property (nonatomic, strong) NSData *responseData;
@property (nonatomic, strong) User *user;

- (User *) retrieveUser: (NSString *)username pw:(NSString *)password;

@end
