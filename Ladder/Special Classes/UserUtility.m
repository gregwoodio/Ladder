//
//  UserUtility.m
//  Ladder
//
//  Created by iOS Xcode User on 2016-04-11.
//  Copyright © 2016 Codebusters. All rights reserved.
//

#import "UserUtility.h"
#import "AppDelegate.h"

@implementation UserUtility
@synthesize responseData, user;

- (User *) retrieveUser: (NSString *) username pw: (NSString *) password {
    responseData = [[NSMutableData alloc] init];
    
    //make POST string
    NSString *post = [NSString stringWithFormat:@"Username=%@&Password=%@", username, password];
    
    //Encode string
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    //Need post length
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    //make URL request
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] init];
    [req setURL: [NSURL URLWithString: @"http://mobile.sheridanc.on.ca/~woodgre/Ladder/LoginUser.php"]];
    [req setHTTPMethod:@"POST"];
    [req setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [req setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [req setHTTPBody: postData];
    
    //Make a URLConnection
//    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:req delegate:self];
  
    //make a synchronous URLConnection
    NSURLResponse *res = nil;
    NSError *err = nil;
    NSData *jsonData = [NSURLConnection sendSynchronousRequest:req returningResponse:&res error:&err];
    [self parseData:jsonData];
    
    
//    if (conn) {
//        AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//        mainDelegate.user = user;
//    } else {
//        NSLog(@"No connection.");
//    }
    
    return self.user;
}

- (void) parseData: (NSData *) data {
    self.user = [[User alloc] init];
    
    NSString *strData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //NSLog(@"%@", strData);
    @try {
        NSArray *json = ((NSArray *)[NSJSONSerialization JSONObjectWithData: [strData dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil])[0];
        NSDictionary *dictionary = (NSDictionary *)[json objectAtIndex:0];
        
        self.user.userID = [dictionary[@"UserID"] integerValue];
        self.user.username = dictionary[@"username"];
        self.user.firstName = dictionary[@"firstname"];
        self.user.lastName = dictionary[@"lastname"];
        self.user.email = dictionary[@"email"];
        self.user.userDescription = dictionary[@"description"];
        self.user.resume = dictionary[@"resume"];
        self.user.academicStatus = [dictionary[@"academic_status"] integerValue];
        //    if (dictionary[@"picture_url"] != nil) {
        //        user.pictureURL = [NSURL URLWithString:dictionary[@"picture_url"]];
        //    }
        self.user.timestamp = dictionary[@"timestamp"];    }
    @catch (NSException *exception) {
        //User was not found so the array has no indices
        self.user = nil;
    }
}


@end
