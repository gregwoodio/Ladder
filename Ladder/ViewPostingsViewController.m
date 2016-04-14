//
//  ViewPostingsViewController.m
//  CodeBusters_PeterViews
//
//  Created by iOS Xcode User on 2016-03-20.
//  Copyright © 2016 Peter Phan. All rights reserved.
//

#import "ViewPostingsViewController.h"
#import "SiteCell.h"
#import "AppDelegate.h"

@interface ViewPostingsViewController ()

@end

@implementation ViewPostingsViewController
@synthesize lbTitle, lbOrganizer, txtDescription, lbLocation, mapView = _mapView;




#pragma mark App Methods

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

-(IBAction)goViewAllPostings:(id)sender
{
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [mainDelegate flipToDetailedPostingHome];
}

@end
