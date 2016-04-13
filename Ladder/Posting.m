//
//  Posting.m
//  CodeBusters_PeterViews
//
//  Created by iOS Xcode User on 2016-04-13.
//  Copyright © 2016 Peter Phan. All rights reserved.
//

#import "Posting.h"

@implementation Posting
@synthesize postingID, jobTitle, organizerName, location, jobDescription;

-(id)initWithData:(NSString *)t theOrganizer:(NSString *)o theLocation:(NSString *)l theDescription:(NSString *)d
{
    if (self = [super init])
    {
        [self setJobTitle:t];
        [self setOrganizerName:o];
        [self setLocation:l];
        [self setJobDescription:d];
    }
    return self;
}

@end
