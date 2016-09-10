//
//  PostingUtility.m
//  Ladder
//
//  Created by iOS Xcode User on 2016-04-13.
//  Copyright © 2016 Codebusters. All rights reserved.
//

#import "PostingUtility.h"
#import "AppDelegate.h"
#import "Posting.h"

@implementation PostingUtility

@synthesize postings;

- (NSArray *) getAllPostings {
    NSError *error;

    //make HTTP request
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] init];
    [req setURL: [NSURL URLWithString: @"http://laddr.xyz/api/posting"]];
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
    
    //The JSON is returned as an array
    NSArray *json = ((NSArray *)[NSJSONSerialization JSONObjectWithData: jsonData options:0 error:nil])[0];
    NSMutableArray *postings = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [json count]; i++) {
        NSDictionary *dict = [json objectAtIndex:i];
        Posting *posting = [[Posting alloc] init];
        posting.postingID = [dict[@"postingID"] integerValue];
        posting.organizerName = dict[@"organizationName"];
        posting.jobTitle = dict[@"jobTitle"];
        posting.location = dict[@"location"];
        posting.jobDescription = dict[@"description"];
        [postings addObject:posting];
    }
    
    return [postings copy];
}

- (Posting *) getPosting: (NSString *)postingID {
    //Get the specified posting
    NSError *error;

    //make HTTP request
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] init];
    NSString *url = [NSString stringWithFormat:@"http://laddr.xyz/api/posting?id=%@", postingID];
    [req setURL: [NSURL URLWithString: url]];
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
    

    @try {
        NSError *err = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&err];

        Posting *posting = [[Posting alloc] init];

        posting.postingID = dictionary[@"PostingID"];
        posting.jobTitle = dictionary[@"JobTitle"];
        posting.organizerName = dictionary[@"OrganizationName"];
        posting.location = dictionary[@"Location"];
        posting.jobDescription = dictionary[@"Description"];

        return posting;
    }
    @catch {
        //error getting posting
    }

    return nil;
}

- (BOOL) addPosting: (Posting *) posting {
    //TODO: Text validation first!
    
    //We'll need a reference to AppDelegate to get the Organization's id
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    //make POST string
    NSString *post = [NSString stringWithFormat:@"ProfileID=%@&JobTitle=%@&Location=%@&Description=%@", mainDelegate.organization.organizationID, posting.jobTitle, posting.location, posting.jobDescription];
    
    //Encode string
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    //Need post length
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    //make URL request
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] init];
    [req setURL: [NSURL URLWithString: @"http://laddr.xyz/api/posting"]];
    [req setHTTPMethod:@"POST"];
    [req setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [req setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [req setHTTPBody: postData];

    //set token as header
    [req setValue: mainDelegate.token forHTTPHeaderField:@"x-access-token"];
    
    //Make a URLConnection
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    
    //successful connection: show message and return to TopicsView
    if (conn) {
        return YES;
    }
    return NO;
}

@end
