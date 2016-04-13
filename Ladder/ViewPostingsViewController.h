//
//  ViewPostingsViewController.h
//  CodeBusters_PeterViews
//
//  Created by iOS Xcode User on 2016-03-20.
//  Copyright © 2016 Peter Phan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapKit/MapKit.h"

@interface ViewPostingsViewController : UIViewController
{
    IBOutlet UILabel *lbTitle;
    IBOutlet UILabel *lbOrganizer;
    IBOutlet UITextView *txtDescription;
    IBOutlet UILabel *lbLocation;
    IBOutlet MKMapView *mapView;
}

@property (nonatomic, strong) IBOutlet UILabel *lbTitle;
@property (nonatomic, strong) IBOutlet UILabel *lbOrganizer;
@property (nonatomic, strong) IBOutlet UITextView *txtDescription;
@property (nonatomic, strong) IBOutlet UILabel *lbLocation;
@property (nonatomic, strong) IBOutlet MKMapView *mapView;

@end
