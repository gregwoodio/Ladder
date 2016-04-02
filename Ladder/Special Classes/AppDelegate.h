//
//  AppDelegate.h
//  major_project
//
//  Created by iOS Xcode User on 2016-03-20.
//  Copyright © 2016 Muska Ahmadzai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "RegisterViewController.h"
#import "ProfileViewController.h"
#import "OrganizationProfileViewController.h"
#import "OrganizationRegisterViewController.h"
#import "TopicsViewController.h"
#import "CommentsViewController.h"
#import "WebViewController.h"
#import "AddTopicViewController.h"
#import "AddCommentViewController.h"

#define ANIMATION_DURATION 1.0f
#define FORWARD 0
#define BACKWARD 1

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    ViewController *homeVC;
    ProfileViewController *profileVC;
    RegisterViewController *registerVC;
    OrganizationProfileViewController *orgProfileVC;
    OrganizationRegisterViewController *orgRegisterVC;
    TopicsViewController *topicsVC;
    CommentsViewController *commentsVC;
    WebViewController *webVC;
    AddTopicViewController *addTopicVC;
    AddCommentViewController *addCommentVC;
    
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ProfileViewController *profileVC;
@property (strong, nonatomic) RegisterViewController *registerVC;
@property (strong, nonatomic) ViewController *homeVC;
@property (strong, nonatomic) OrganizationProfileViewController *orgProfileVC;
@property (strong, nonatomic) OrganizationRegisterViewController *orgRegisterVC;
@property (nonatomic, strong) TopicsViewController *topicsVC;
@property (nonatomic, strong) CommentsViewController *commentsVC;
@property (nonatomic, strong) WebViewController *webVC;
@property (nonatomic, strong) AddTopicViewController *addTopicVC;
@property (nonatomic, strong) AddCommentViewController *addCommentVC;

#pragma mark - Navigation methods

- (void) flipToRegister;
- (void) flipToRegisterHome;
- (void) flipToProfile;
- (void) flipToProfileHome;
- (void) flipToOrgRegister;
- (void) flipToOrgRegisterHome;
- (void) flipToOrgProfile;
- (void) flipToOrgProfileHome;
- (void) flipToComments: (NSInteger *) topicID titleText: (NSString *) title;
- (void) flipToCommentsBack;
- (void) flipToTopics;
- (void) flipToTopicsHome;
- (void) swapViews: (UIView *)from goingTo: (UIView *)to;
- (void) setupAnimation: (NSInteger) direction;

@end

