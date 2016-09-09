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
@synthesize user, org;

- (Profile *) login: (NSString *) username pw: (NSString *) password {
    //Creates a request using username and password, sets the token if successful and returns the User or Organization object
    
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
    
    @try {

        NSDictionary *dict = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&err];
        
        if (!dict) {
            NSLog(@"The dictionary didn't initialize properly");
        } else {

            NSString *token = [dict objectForKey:@"token"];
            NSLog(@"%@", token);
            AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            mainDelegate.token = token;
            
            //now make a second request using the token to get the user or organization
            //TODO: Add fixes to return an Organization from the same login method
            return [self retrieveProfile];
        }

    }
    @catch (NSException *exception) {
        //something went wrong, no token
    }
    
    return nil;
}

- (Profile *) retrieveProfile {

    //make URL request
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] init];
    [req setURL: [NSURL URLWithString: @"http://laddr.xyz/api/profile"]];
    [req setHTTPMethod:@"GET"];
    [req setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    //set token as header
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [req setValue: mainDelegate.token forHTTPHeaderField:@"x-access-token"];
 
    //make a synchronous URLConnection
    //TODO: All requests should be asynchronous
    NSURLResponse *res = nil;
    NSError *err = nil;
    NSData *jsonData = [NSURLConnection sendSynchronousRequest:req returningResponse:&res error:&err];
    
    //parse into user object
    return [self parseData:jsonData];
    
    // NSLog(@"User %@ logged in.\nName: %@ %@\n", self.user.username, self.user.firstName, self.user.lastName);
    // NSLog(@"ProfileID: %@", self.user.userID);
    // NSLog(@"Email: %@", self.user.email);
    // NSLog(@"Description: %@", self.user.userDescription);
    // NSLog(@"Resume: %@", self.user.resume);
    // NSLog(@"Academic Status: %@", self.user.academicStatus);
}

- (Profile *) parseData: (NSData *) data {
    
    @try {
        NSError *err = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];

        if (dictionary[@"AccountType"] == 0) {
            //user
            self.user = [[User alloc] init];

            self.user.userID = dictionary[@"ProfileID"];
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
            self.user.timestamp = dictionary[@"Timestamp"];    

            //NSLogs for debugging
            NSLog(@"User %@ logged in.\nName: %@ %@\n", self.user.username, self.user.firstName, self.user.lastName);
            NSLog(@"ProfileID: %@", self.user.userID);
            NSLog(@"Email: %@", self.user.email);
            NSLog(@"Description: %@", self.user.userDescription);
            NSLog(@"Resume: %@", self.user.resume);
            NSLog(@"Academic Status: %@", self.user.academicStatus);

            return self.user;

        } else if (dictionary[@"AccountType"] == 1) {
            self.org = [[Organization alloc] init];

            self.org.organizationID = dictionary[@"ProfileID"];
            self.org.username = dictionary[@"Username"];
            self.org.organizationName = dictionary[@"OrganizationName"];
            self.org.email = dictionary[@"Email"];
    //        self.org.url = dictionary[@"URL"];
            self.org.missionStatement = dictionary[@"MissionStatement"];
            //    if (dictionary[@"photo_url"] != nil) {
            //        org.photo_url = [NSURL URLWithString:dictionary[@"PictureURL"]];
            //    }
            self.user.timestamp = dictionary[@"Timestamp"];

            //NSLogs for debugging
            NSLog(@"User %@ logged in.\nOrganization Name: %@ %@\n", self.org.username, self.org.organizationName);
            NSLog(@"ProfileID: %@", self.org.userID);
            NSLog(@"Email: %@", self.org.email);
            NSLog(@"Mission Statement: %@", self.org.missionStatement);

            return self.org;  
        }
        
        
    } @catch (NSException *exception) {
        //Error parsing data into dictionary
    }
    return nil;
}

@end
