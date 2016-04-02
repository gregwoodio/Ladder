//
//  AddCommentViewController.m
//  LadderTest
//
//  Created by iOS Xcode User on 2016-03-20.
//  Copyright © 2016 Greg Wood. All rights reserved.
//

#import "AddCommentViewController.h"
#import "AppDelegate.h"

@interface AddCommentViewController ()

@end

@implementation AddCommentViewController

@synthesize txtUsername, txtCommentBody, lblTitle, topicID, topicTitle;

- (void)viewDidLoad {
    [super viewDidLoad];
    [lblTitle setText:topicTitle];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Add Comment method

// This method is the meat and potatoes of the AddCommentViewController.
// Creates a POST request to a PHP script that adds the data to the database,
// then redirects the user back to the CommentsView.
- (IBAction)addComment:(id)sender {
    
    //TODO: Text validation first!
    
    //make POST string
    NSString *post = [NSString stringWithFormat:@"TopicID=%zd&Creator=%@&Body=%@", topicID, txtUsername.text, txtCommentBody.text];
    
    //Encode string
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    //Need post length
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    //make URL request
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] init];
    [req setURL: [NSURL URLWithString: @"http://mobile.sheridanc.on.ca/~woodgre/AddComment.php"]];
    [req setHTTPMethod:@"POST"];
    [req setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [req setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [req setHTTPBody: postData];
    
    //Make a URLConnection
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    
    //successful connection: show message and return to CommentsView
    if (conn) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Success" message:@"Your comment was added." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                   handler: ^(UIAlertAction *action) {
                                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                                       [self returnToSender:nil];
                                                   }];
        [alert addAction:ok];
        
        [self presentViewController:alert animated: YES completion:nil];
        
        //error, connection was not made.
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Failure." message:@"Your comment wasn't added. Check your internet connection, or try again later." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                   handler: ^(UIAlertAction *action) {
                                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                                   }];
        [alert addAction:ok];
        
        [self presentViewController:alert animated: YES completion:nil];
    }
    
}


#pragma mark - Navigation

- (IBAction)returnToSender:(id)sender {
    //You can only navigate to Add Comment from Comments. Go back
    AppDelegate *mainDelegate = [[UIApplication sharedApplication] delegate];
    [mainDelegate setupAnimation:BACKWARD];
    [mainDelegate swapViews:mainDelegate.addCommentVC.view goingTo:mainDelegate.commentsVC.view];
    mainDelegate.addCommentVC = nil;
 }

@end
