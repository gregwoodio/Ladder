//
//  ViewPostingsViewController.m
//  CodeBusters_PeterViews
//
//  Created by iOS Xcode User on 2016-03-20.
//  Copyright © 2016 Peter Phan. All rights reserved.



/*  Author : Peter
 *  
 *
 *
 *
 *
 */

#import "ViewPostingsViewController.h"
#import "SiteCell.h"
#import "AppDelegate.h"
#import <Social/Social.h>

@interface ViewPostingsViewController ()

@end

@implementation ViewPostingsViewController
@synthesize lbTitle, lbOrganizer, txtDescription, lbLocation, mapView = _mapView, tweetBtn;


#pragma mark App Methods

/* Author : Peter
 *
 *
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //Taking the selected object

    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    Posting *posting = mainDelegate.selectedPosting;
    
    NSString *jobTitle = posting.jobTitle;
    NSString *organizer = posting.organizerName;
    NSString *location = posting.location;
    NSString *jobDescription = posting.jobDescription;

    txtDescription.editable = NO;
    [lbTitle setText:jobTitle];
    [lbOrganizer setText:organizer];
    [txtDescription setText:jobDescription];
    [lbLocation setText:location];
    
    //Mapview shizz
    self.mapView.mapType = MKMapTypeStandard;
    [self location];
}

/* Author : Peter
 *
 *
 */


-(void)location
{
    MKCoordinateRegion region;
    region.center.latitude = 43.6563091;
    region.center.longitude = -79.7415375;
    region.span.latitudeDelta = 0.015872;
    region.span.longitudeDelta = 0.015863;
    
    [self.mapView setRegion:region animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/* Author : Peter
 * Method allows the view to return to the previous view
 */

-(IBAction)goViewAllPostings:(id)sender
{
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [mainDelegate flipToDetailedPostingHome];
}


#pragma mark - Tweet

/* Author : Alan
 * This method will invoke the SLComposeViewController to appear
 * allowing the user to tweet the description of the posting
 */
- (IBAction)postToTwitter:(id)sender {
    
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    Posting *posting = mainDelegate.selectedPosting;
    
    NSString *jobDescription = posting.jobDescription;
    
    //Originally the if condition checked to see if the Twitter service was available
    // but due to some unknown error, I can't actually login to Twitter...
    //if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    //{
    
    //VC is created to show the tweet
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
    //Set the text so that when the editable tweet appears, it will automatically
    //have the description set
        [tweetSheet setInitialText:jobDescription];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    //}
    
}


@end
