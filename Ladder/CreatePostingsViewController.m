//
//  CreatePostingsViewController.m
//  CodeBusters_PeterViews
//
//  Created by iOS Xcode User on 2016-03-20.
//  Copyright © 2016 Peter Phan. All rights reserved.
//


/*
 Author: Peter Phan
 Description:
 
 */


#import "CreatePostingsViewController.h"
#import "AppDelegate.h"

@interface CreatePostingsViewController ()

@end

@implementation CreatePostingsViewController
@synthesize txtTitle, txtOrganizer, txtLocation, txtDescription;


#pragma mark Data Submission
-(IBAction)addPosting:(id)sender
{
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSString *title = txtTitle.text;
    NSString *organizer = txtOrganizer.text;
    NSString *location = txtLocation.text;
    NSString *description = txtDescription.text;
    
    if ([title isEqualToString:@""] || [organizer isEqualToString:@""] || [location isEqualToString:@""] || [description isEqualToString:@""])
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Submission Error" message:@"Please enter valid information!" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil];
        
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else
    {
        Posting *post = [[Posting alloc] initWithData:title theOrganizer:organizer theLocation:location theDescription:description];
    
        [mainDelegate addPosting:post];
    
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Thank You!" message:@"Your posting has been created for others to see." preferredStyle:UIAlertControllerStyleAlert];
    
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil];

        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
}


#pragma mark Navigation

-(IBAction)goViewAllPostings:(id)sender
{
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [mainDelegate flipToCreatePostingsHome];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
