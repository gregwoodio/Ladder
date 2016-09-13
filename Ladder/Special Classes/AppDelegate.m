//
//  AppDelegate.m
//  major_project
//
//  Created by iOS Xcode User on 2016-04-01.
//  Copyright © 2016 Greg Wood. All rights reserved.
//

#import "AppDelegate.h"
#import "UserUtility.h"


@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize token, window,homeVC, profileVC, registerVC, orgProfileVC, orgRegisterVC, topicsVC, commentsVC, webVC, addTopicVC, addCommentVC, dashVC, loginVC, aboutVC, viewPostVC, allPostingsVC, createPostVC, postings, selectedPosting, user, organization, _audioPlayer;

#pragma mark - Navigation - Alan
-(void)transToDash
{
    self.dashVC = [[DashBoardViewController alloc] initWithNibName:@"DashBoardViewController" bundle:nil];
    [self setupAnimation:FORWARD];
    [self swapViews:self.loginVC.view goingTo:self.dashVC.view];
    //Peter's Data init
    PostingUtility *pu = [[PostingUtility alloc] init];
    NSLog(@"pre posting call");
    self.postings = [[pu getAllPostings] copy];
    NSLog(@"post postings call");
    self.postings= [[NSMutableArray alloc] init];
    Posting *p = [[Posting alloc] init];
}

-(void)transToAbout{
    self.aboutVC = [[AboutUsViewController alloc] initWithNibName:@"AboutUsViewController" bundle:nil];
    [self setupAnimation:FORWARD];
    [self swapViews:self.dashVC.view goingTo:self.aboutVC.view];
}

-(void)transToLogin
{
    self.aboutVC = [[AboutUsViewController alloc] initWithNibName:@"View" bundle:nil];
    [self setupAnimation:BACKWARD];
    [self swapViews:self.dashVC.view goingTo:self.loginVC.view];
}

-(void)transToDashFromAbout{
    self.dashVC = [[DashBoardViewController alloc] initWithNibName:@"DashBoardViewController" bundle:nil];
    [self setupAnimation:BACKWARD];
    [self swapViews:self.aboutVC.view goingTo:self.dashVC.view];
}

-(void)transToPostings
{
    PostingUtility *pu = [[PostingUtility alloc] init];
    self.postings = [pu getAllPostings];
    self.allPostingsVC = [[AllPostingsViewController alloc] initWithNibName:@"AllPostingsViewController" bundle:nil];
    [self setupAnimation:FORWARD];
    [self swapViews:self.dashVC.view goingTo:self.allPostingsVC.view];
}

-(void)transToDashFromPostings{
    self.allPostingsVC = [[AllPostingsViewController alloc] initWithNibName:@"AllPostingsViewController" bundle:nil];
    [self setupAnimation:BACKWARD];
    [self swapViews:self.allPostingsVC.view goingTo:self.dashVC.view];
}


#pragma mark - Navigation

- (void) setupAnimation: (NSInteger) direction {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:ANIMATION_DURATION];
    if (direction == FORWARD) {
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:window cache:YES];
    } else {
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:window cache:YES];
    }
}

- (void) swapViews: (UIView *)from goingTo: (UIView *)to {
    [_audioPlayer play];
    [from removeFromSuperview];
    [self.window addSubview: to];
    [UIView commitAnimations];
}

- (void) flipToRegister {
    self.registerVC = [[RegisterViewController alloc] initWithNibName:@"RegisterViewController" bundle:nil];
    [self setupAnimation:FORWARD];
    [self swapViews: self.loginVC.view goingTo:self.registerVC.view];
    [self playSound];
}

-(void)flipToRegisterHome{
    [self setupAnimation:BACKWARD];
    [self swapViews:self.registerVC.view goingTo:self.loginVC.view];
    self.registerVC = nil;
    [self playSound];
}


-(void)flipToProfile {
    self.profileVC = [[ProfileViewController alloc] initWithNibName:@"ProfileViewController" bundle:nil];
    [self setupAnimation:FORWARD];
    [self swapViews: self.dashVC.view goingTo:self.profileVC.view];
    [self playSound];
}

-(void)flipToProfileHome {
    [self setupAnimation:BACKWARD];
    [self swapViews:self.profileVC.view goingTo:self.dashVC.view];
    self.profileVC = nil;
    [self playSound];
}

-(void)flipToOrgRegister {
    self.orgRegisterVC = [[OrganizationRegisterViewController alloc] initWithNibName:@"OrganizationRegisterViewController" bundle:nil];
    [self setupAnimation:FORWARD];
    [self swapViews: self.loginVC.view goingTo:self.orgRegisterVC.view];
    [self playSound];
}

-(void)flipToOrgRegisterHome {
    [self setupAnimation:BACKWARD];
    [self swapViews:self.orgRegisterVC.view goingTo:self.loginVC.view];
    self.orgRegisterVC = nil;
    [self playSound];
}

-(void)flipToOrgProfile {
    self.orgProfileVC = [[OrganizationProfileViewController alloc] initWithNibName:@"OrganizationProfileViewController" bundle:nil];
    self.orgProfileVC.organization = self.organization;
    [self setupAnimation:FORWARD];
    [self swapViews: self.dashVC.view goingTo:self.orgProfileVC.view];
    [self playSound];
}

-(void)flipToOrgProfileHome {
    [self setupAnimation:BACKWARD];
    [self swapViews:self.orgProfileVC.view goingTo:self.dashVC.view];
    self.orgProfileVC = nil;
    [self playSound];
}

- (void) flipToComments: (NSInteger *)topicID titleText: (NSString *) title {
    self.commentsVC = [[CommentsViewController alloc] initWithNibName:@"CommentsViewController" bundle:nil];
    self.commentsVC.topicID = topicID;
    self.commentsVC.titleText = title;
    [self setupAnimation:FORWARD];
    [self swapViews: self.topicsVC.view goingTo:self.commentsVC.view];
    [self playSound];
}

- (void) flipToCommentsBack {
    [self setupAnimation:BACKWARD];
    [self swapViews:self.commentsVC.view goingTo:self.topicsVC.view];
    self.commentsVC = nil;
    [self playSound];
}

- (void) flipToTopics {
    self.topicsVC = [[TopicsViewController alloc] initWithNibName:@"TopicsViewController" bundle:nil];
    [self setupAnimation:FORWARD];
    [self swapViews:self.dashVC.view goingTo:self.topicsVC.view];
    [self playSound];
}

- (void) flipToTopicsHome {
    [self setupAnimation:BACKWARD];
    [self swapViews:self.topicsVC.view goingTo:self.dashVC.view];
    self.topicsVC = nil;
    [self playSound];
}

#pragma mark - Peter's Navigation Tools
//Move from view postings to create a posting
-(void)flipToCreatePostings
{
    CreatePostingsViewController *cpvc = [[CreatePostingsViewController alloc] initWithNibName:@"CreatePostingsViewController" bundle:nil];
    self.createPostVC = cpvc;
    
    [self setupAnimation:FORWARD];
    [self swapViews:self.allPostingsVC.view goingTo:self.createPostVC.view];
    [self playSound];
    
}

//Move from create postings to view postings
-(void)flipToCreatePostingsHome
{
    PostingUtility *pu = [[PostingUtility alloc] init];
    self.postings = [pu getAllPostings];
    [self setupAnimation:BACKWARD];
    [self swapViews:self.createPostVC.view goingTo:self.allPostingsVC.view];
    [self playSound];
}

//Move from view all postings (home) to view detailed posting
-(void)flipToDetailedPosting: (Posting *) posting
{
    ViewPostingsViewController *vpvc = [[ViewPostingsViewController alloc] initWithNibName:@"ViewPostingDetailsController" bundle:nil];
    self.viewPostVC = vpvc;
    self.selectedPosting = posting;
    
    [self setupAnimation:FORWARD];
    [self swapViews:self.allPostingsVC.view goingTo:self.viewPostVC.view];
    [self playSound];
    
}

-(void)flipToDetailedPostingHome
{
    [self setupAnimation:BACKWARD];
    [self swapViews:self.viewPostVC.view goingTo:self.allPostingsVC.view];
    [self playSound];
    
    viewPostVC = nil;
}

-(void)addPosting:(Posting *)post
{
//    [self.postings addObject:post];
    PostingUtility *pu = [[PostingUtility alloc] init];
    [pu addPosting:post];
}


#pragma mark - Other methods

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //Peter's Data init
    //PostingUtility *pu = [[PostingUtility alloc] init];
    //NSLog(@"pre posting call");
    //self.postings = [[pu getAllPostings] copy];
    //NSLog(@"post postings call");

//    self.postings= [[NSMutableArray alloc] init];
//    Posting *p = [[Posting alloc] init];
//    p.organizerName = @"Sheridan";
//    p.location = @"Davis";
//    p.jobTitle = @"Volunteer";
//    p.jobDescription = @"SSU volunteer position";
//    
//    [self.postings addObject:p];
    
    // Construct URL to sound file
    NSString *path = [NSString stringWithFormat:@"%@/pageturn.wav", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    
    // Create audio player object and initialize with URL to sound
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    //get the user
    UserUtility *uu = [[UserUtility alloc] init];
    //self.user = [uu retrieveUser:@"caseyjones" pw:@"password"];
    //self.organization = [uu retrieveOrganization:@"sheridan" pw:@"password"];
    
    //Home screen init
    self.window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    self.loginVC = [[ViewController alloc] initWithNibName:@"View" bundle:nil];
    self.window.rootViewController = self.loginVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark - User
- (BOOL) loginUser: (NSString *) username pw: (NSString *) password {
    UserUtility *uu = [[UserUtility alloc] init];
    self.user = [uu login:username pw:password];
    if (self.user == nil) {
        return NO;
    }
    return YES;
}

- (BOOL) loginOrganization: (NSString *) username pw: (NSString *) password {
    UserUtility *uu = [[UserUtility alloc] init];
    self.organization = [uu login:username pw:password];
    if (self.user == nil) {
        return NO;
    }
    return YES;
}

#pragma mark - Audio

- (void) playSound {
    AudioServicesPlaySystemSound(systemSoundID);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
