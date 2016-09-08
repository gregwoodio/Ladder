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
@synthesize responseData, user, org;

- (User *) login: (NSString *) username pw: (NSString *) password {
    //Creates a request using username and password, sets the token if successful and returns the User or Organization object
    responseData = [[NSMutableData alloc] init];
    
    //make POST string
    NSString *post = [NSString stringWithFormat:@"Username=%@&Password=%@", username, password];
    
    //Encode string
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    //Need post length
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    //make URL request
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] init];
    [req setURL: [NSURL URLWithString: @"http://laddr.xyz/api/login"]];
    [req setHTTPMethod:@"POST"];
    [req setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [req setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [req setHTTPBody: postData];
 
    //make a synchronous URLConnection
    NSURLResponse *res = nil;
    NSError *err = nil;
    NSData *jsonData = [NSURLConnection sendSynchronousRequest:req returningResponse:&res error:&err];
    
    //check for success
    NSString *strData = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];

    @try {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:strData options:0 error:&err];
        NSString *success = [dict objectForKey:@"success"];
        if ([success isEqualToString:@"true"]) {
            NSString *token = [dict objectForKey:@"token"];
            AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            mainDelegate.token = token;

            //now make a second request using the token to get the user or organization
            //TODO: Add fixes to return an Organization from the same login method
            return [self getUser];
        }
    }
    @catch (NSException *exception) {
        //something went wrong, no token
    }
    //[self parseData:jsonData];
    
    return nil;
}

- (User *) getUser {
    responseData = [[NSMutableData alloc] init];
    
    // //make POST string
    // NSString *post = [NSString stringWithFormat:@"Username=%@&Password=%@", username, password];
    
    // //Encode string
    // NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    // //Need post length
    // NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    //make URL request
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] init];
    [req setURL: [NSURL URLWithString: @"http://laddr.xyz/api/user"]];
    [req setHTTPMethod:@"GET"];
    // [req setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [req setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    // [req setHTTPBody: postData];
    //set token as header
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [req setValue: mainDelegate.token forHTTPHeaderField:@"x-access-token"];
 
    //make a synchronous URLConnection
    NSURLResponse *res = nil;
    NSError *err = nil;
    NSData *jsonData = [NSURLConnection sendSynchronousRequest:req returningResponse:&res error:&err];
    
    //parse into user object
    [self parseData:jsonData];
    return self.user;
}

- (void) parseData: (NSData *) data {
    self.user = [[User alloc] init];
    
    NSString *strData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //NSLog(@"%@", strData);
    @try {
        NSError *err = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:strData options:0 error:&err];
        
        self.user.userID = [dictionary[@"ProfileID"] integerValue];
        self.user.username = dictionary[@"Username"];
        self.user.firstName = dictionary[@"FirstName"];
        self.user.lastName = dictionary[@"LastName"];
        self.user.email = dictionary[@"Email"];
        self.user.userDescription = dictionary[@"Description"];
        self.user.resume = dictionary[@"Resume"];
        self.user.academicStatus = [dictionary[@"AcademicStatus"] integerValue];
        //    if (dictionary[@"picture_url"] != nil) {
        //        user.pictureURL = [NSURL URLWithString:dictionary[@"picture_url"]];
        //    }
        self.user.timestamp = dictionary[@"Timestamp"];    }
    @catch (NSException *exception) {
        //User was not found so the array has no indices
        self.user = nil;
    }
}

#pragma mark - Organization methods

- (Organization *) retrieveOrganization: (NSString *) username pw: (NSString *) password {
    responseData = [[NSMutableData alloc] init];
    
    //make POST string
    NSString *post = [NSString stringWithFormat:@"Username=%@&Password=%@", username, password];
    
    //Encode string
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    //Need post length
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    //make URL request
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] init];
    [req setURL: [NSURL URLWithString: @"http://mobile.sheridanc.on.ca/~woodgre/Ladder/LoginOrganization.php"]];
    [req setHTTPMethod:@"POST"];
    [req setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [req setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [req setHTTPBody: postData];
    
    //make a synchronous URLConnection
    NSURLResponse *res = nil;
    NSError *err = nil;
    NSData *jsonData = [NSURLConnection sendSynchronousRequest:req returningResponse:&res error:&err];
    [self parseOrganizationData:jsonData];
    
    return self.org;
}

- (void) parseOrganizationData: (NSData *) data {
    self.org = [[Organization alloc] init];
    
    NSString *strData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //NSLog(@"%@", strData);
    @try {
        NSArray *json = ((NSArray *)[NSJSONSerialization JSONObjectWithData: [strData dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil])[0];
        NSDictionary *dictionary = (NSDictionary *)[json objectAtIndex:0];
        
        self.org.organizationID = [dictionary[@"organizationID"] integerValue];
        self.org.username = dictionary[@"username"];
        self.org.organizationName = dictionary[@"organizationName"];
        self.org.email = dictionary[@"email"];
//        self.org.url = dictionary[@"url"];
        self.org.missionStatement = dictionary[@"mission_statement"];
        //    if (dictionary[@"photo_url"] != nil) {
        //        org.photo_url = [NSURL URLWithString:dictionary[@"photo_url"]];
        //    }
        self.user.timestamp = dictionary[@"timestamp"];    }
    @catch (NSException *exception) {
        //User was not found so the array has no indices
        self.user = nil;
    }
}

@end
