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
    
    //read JSON from URL
    NSURL *url = [NSURL URLWithString:@"http://mobile.sheridanc.on.ca/~woodgre/Ladder/AllTopics.php"];
    NSString *file = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    
    /*
     if (error) {
     NSLog(@"%@",[error description]);
     } else {
     NSLog(@"%@", [file description]);
     }
     */
    
    //The JSON being returned was returning an array of arrays, get the [0]th element
    self.postings = ((NSArray *)[NSJSONSerialization JSONObjectWithData: [file dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil])[0];
    return self.postings;
}

- (Posting *) getPosting: (NSInteger) postingID {
    [self getAllPostings];
    for (int i = 0; i < [self.postings count]; i++) {
        if (((Posting *)[self.postings objectAtIndex:i]).postingID == postingID) {
            return [self.postings objectAtIndex:i];
        }
    }
    return nil;
}

- (BOOL) addPosting: (Posting *) posting {
    //TODO: Text validation first!
    
    //We'll need a reference to AppDelegate to get the Organization's id
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    //make POST string
    NSString *post = [NSString stringWithFormat:@"OrganizationID=%ld&JobTitle=%@&Location=%@&Description=%@", mainDelegate.organization.organizationID, posting.jobTitle, posting.location, posting.jobDescription];
    
    //Encode string
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    //Need post length
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    //make URL request
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] init];
    [req setURL: [NSURL URLWithString: @"http://mobile.sheridanc.on.ca/~woodgre/Ladder/AddPosting.php"]];
    [req setHTTPMethod:@"POST"];
    [req setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [req setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [req setHTTPBody: postData];
    
    //Make a URLConnection
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    
    //successful connection: show message and return to TopicsView
    if (conn) {
        return YES;
    }
    return NO;
}

@end
