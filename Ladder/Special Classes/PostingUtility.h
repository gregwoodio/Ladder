//
//  PostingUtility.h
//  Ladder
//
//  Created by iOS Xcode User on 2016-04-13.
//  Copyright © 2016 Codebusters. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Posting.h"

@interface PostingUtility : NSObject
{
    NSArray *postings;
}
@property (nonatomic, strong) NSArray *postings;

- (NSArray *) getAllPostings;
- (Posting *) getPosting: (NSInteger) postingID;
- (BOOL) addPosting: (Posting *) posting;

@end