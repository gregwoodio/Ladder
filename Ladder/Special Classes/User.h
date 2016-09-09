//
//  User.h
//  Ladder
//
//  Created by iOS Xcode User on 2016-04-11.
//  Copyright © 2016 Codebusters. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : Profile
{
    NSString *firstName;
    NSString *lastName;
    NSString *userDescription;
    NSString *resume;
    NSInteger academicStatus;
}

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *userDescription;
@property (nonatomic, strong) NSString *resume;
@property (nonatomic) NSInteger academicStatus;

@end
