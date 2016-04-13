//
//  AppDelegate.h
//  major_project
//
//  Created by iOS Xcode User on 2016-03-20.
//  Copyright © 2016 Muska Ahmadzai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
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
#import "User.h"
#import "Organization.h"
#import "DashBoardViewController.h"
#import "AboutUsViewController.h"
#import <AVFoundation/AVFoundation.h>

#define ANIMATION_DURATION 1.0f
#define FORWARD 0
#define BACKWARD 1
#define systemSoundID 1104

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
    User *user;
    Organization *organization;
    DashBoardViewController *dashVC;
    AboutUsViewController *aboutVC;
    AppDelegate *mainDelegate;
    AVAudioPlayer *_audioPlayer; //holds the AVAudioPlayer object
    
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
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) Organization *organization;
@property (nonatomic, strong) AVAudioPlayer *_audioPlayer;

#pragma mark - Objects Alan
@property (strong, nonatomic) ViewController *loginVC;
@property (strong, nonatomic) DashBoardViewController *dashVC;
@property (strong, nonatomic) AboutUsViewController *aboutVC;


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
- (void) loginUser: (NSString *) username pw: (NSString *) password;

#pragma mark - Naviagation Methods Alan
-(void)transToDash;
-(void)transToLogin;
-(void)transToAbout;
-(void)transToDashFromAbout;


#pragma mark Navigation Methods Peter




#pragma mark Navigation Methods Greg



#pragma mark Navigation Methods Muska



@end

