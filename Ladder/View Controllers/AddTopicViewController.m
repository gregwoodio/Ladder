//
//  AddTopicViewController.m
//  LadderTest
//
//  Created by iOS Xcode User on 2016-03-20.
//  Copyright © 2016 Greg Wood. All rights reserved.
//

/*
 Author: Greg Wood
 This is the m file for Add Topics view.
 The user will have the ability to add a Topic to the forum.
 
 */

#import "AddTopicViewController.h"
#import "AppDelegate.h"

@interface AddTopicViewController ()

@end

@implementation AddTopicViewController

@synthesize txtUsername, txtTopicName, txtCommentBody;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Add Topic method


/*
 Author: Greg Wood
 // This method is the meat and potatoes of the AddTopicViewController.
 // Creates a POST request to a API that adds the data to the database,
 // then redirects the user back to the TopicsView.
 */


- (IBAction)addTopic:(id)sender {
    
    //TODO: Text validation first! 
    if (txtTopicName.text == @"" || txtUsername.text == @"" || txtCommentBody.text == @"") {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Failure." message:@"Please fill out all fields." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                   handler: ^(UIAlertAction *action) {
                                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                                   }];
        [alert addAction:ok];
        
        [self presentViewController:alert animated: YES completion:nil];
    } else {
        
        //make POST string
        NSString *post = [NSString stringWithFormat:@"Title=%@&Creator=%@&Body=%@", txtTopicName.text, txtUsername.text, txtCommentBody.text];
        
        //Encode string
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        //Need post length
        NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
        
        //make URL request
        NSMutableURLRequest *req = [[NSMutableURLRequest alloc] init];
        [req setURL: [NSURL URLWithString: @"http://laddr.xyz/api/topic"]];
        [req setHTTPMethod:@"POST"];
        [req setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [req setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [req setHTTPBody: postData];

        //set token as header
        AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [req setValue: mainDelegate.token forHTTPHeaderField:@"x-access-token"];
        
        //Make a URLConnection
        NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:req delegate:self];

        //successful connection: show message and return to TopicsView
        if (conn) {
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Success" message:@"Your topic was created." preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                      handler: ^(UIAlertAction *action) {
                                                          //[alert dismissViewControllerAnimated:YES completion:nil];
                                                          [self returnToSender:nil];
                                                      }];
            [alert addAction:ok];
            
            [self presentViewController:alert animated: YES completion:nil];
        
        //error, connection was not made.
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Failure." message:@"Your topic wasn't created. Check your internet connection, or try again later." preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                       handler: ^(UIAlertAction *action) {
                                                           [alert dismissViewControllerAnimated:YES completion:nil];
                                                       }];
            [alert addAction:ok];
            
            [self presentViewController:alert animated: YES completion:nil];
        }
    }
    
}


#pragma mark - Navigation

/*
 Author: Greg Wood
 Transition from current view to Topics View.
 */

- (IBAction)returnToSender:(id)sender {
    //You can only navigate to Add Topics from Topics. Go back
    AppDelegate *mainDelegate = [[UIApplication sharedApplication] delegate];
    [mainDelegate setupAnimation:BACKWARD];
    
    //recreate the TopicsViewController to get the latest topics
    //TODO: Ask if this is leaking memory
    //mainDelegate.topicsVC = [[TopicsViewController alloc] init];
    
    [mainDelegate swapViews:mainDelegate.addTopicVC.view goingTo:mainDelegate.topicsVC.view];
    mainDelegate.addTopicVC = nil;
}

@end
