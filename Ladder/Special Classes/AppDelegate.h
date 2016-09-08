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
#import "WebViewController.h"



#pragma mark - Muska's Imports
#import "RegisterViewController.h"
#import "ProfileViewController.h"
#import "OrganizationProfileViewController.h"
#import "OrganizationRegisterViewController.h"
#import "User.h"
#import "Organization.h"

#pragma mark - Greg's Imports
#import "TopicsViewController.h"
#import "CommentsViewController.h"
#import "AddTopicViewController.h"
#import "AddCommentViewController.h"

#import "User.h"
#import "Organization.h"
#import "PostingUtility.h"


#pragma mark - Alan's Imports
#import "ViewController.h"
#import "DashBoardViewController.h"
#import "AboutUsViewController.h"
#import <AVFoundation/AVFoundation.h>

#pragma mark - Peter's Imports
#import "CreatePostingsViewController.h"
#import "AllPostingsViewController.h"
#import "ViewPostingsViewController.h"
#import "SiteCell.h"

#pragma mark Constants Declared

#define ANIMATION_DURATION 1.0f
#define FORWARD 0
#define BACKWARD 1
#define systemSoundID 1104

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSString *token;
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
    
    
    //Peter's objects
    AllPostingsViewController *allPostingsVC;
    CreatePostingsViewController *createPostVC;
    ViewPostingsViewController *viewPostVC;
    NSArray *postings;
    Posting *selectedPosting;
    
}
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) AVAudioPlayer *_audioPlayer;

#pragma mark - Objects Muska


#pragma mark - Objects Greg

@property (strong, nonatomic) NSString *token;
@property (strong, nonatomic) ProfileViewController *profileVC;
@property (strong, nonatomic) RegisterViewController *registerVC;
@property (strong, nonatomic) OrganizationProfileViewController *orgProfileVC;
@property (strong, nonatomic) OrganizationRegisterViewController *orgRegisterVC;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) Organization *organization;



#pragma mark - Objects Greg
@property (nonatomic, strong) TopicsViewController *topicsVC;
@property (nonatomic, strong) CommentsViewController *commentsVC;
@property (nonatomic, strong) WebViewController *webVC;
@property (nonatomic, strong) AddTopicViewController *addTopicVC;
@property (nonatomic, strong) AddCommentViewController *addCommentVC;



#pragma mark - Objects Alan
@property (strong, nonatomic) ViewController *homeVC;
@property (strong, nonatomic) ViewController *loginVC;
@property (strong, nonatomic) DashBoardViewController *dashVC;
@property (strong, nonatomic) AboutUsViewController *aboutVC;


#pragma mark - Objects Peter
@property (strong, nonatomic) AllPostingsViewController *allPostingsVC;
@property (strong, nonatomic) CreatePostingsViewController *createPostVC;
@property (strong, nonatomic) ViewPostingsViewController *viewPostVC;
@property (strong, nonatomic) NSArray *postings;
@property (nonatomic, strong) Posting *selectedPosting;


#pragma mark - Navigation methods Greg
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
- (BOOL) loginUser: (NSString *) username pw: (NSString *) password;
- (BOOL) loginOrganization: (NSString *) username pw: (NSString *) password;

#pragma mark - Naviagation Methods Alan
-(void)transToDash;
-(void)transToLogin;
-(void)transToAbout;
-(void)transToDashFromAbout;
-(void)transToPostings;
-(void)transToDashFromPostings;

#pragma mark Navigation Methods Peter
-(void)flipToCreatePostings;
-(void)flipToCreatePostingsHome;
-(void)flipToDetailedPosting: (Posting *) post;
-(void)flipToDetailedPostingHome;
-(void)addPosting:(Posting *)post;


#pragma mark Navigation Methods Muska



@end

