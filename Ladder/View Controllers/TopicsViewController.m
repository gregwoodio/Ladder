//
//  TopicsViewController.m
//  LadderTest
//
//  Created by iOS Xcode User on 2016-03-15.
//  Copyright © 2016 Greg Wood. All rights reserved.
//

#import "TopicsViewController.h"
#import "AppDelegate.h"

@interface TopicsViewController ()

@end

@implementation TopicsViewController

@synthesize topics, tblTopics;

#pragma mark - View Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //TODO: Fix crashes when JSON can't be found.
    
    NSError *error;
    
    //read JSON from URL
    NSURL *url = [NSURL URLWithString:@"http://mobile.sheridanc.on.ca/~woodgre/Ladder/AllTopics.php"];
    NSString *file = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    
    /*
    if (error) {
        NSLog(@"%@",[error description]);
    } else {
        NSLog(@"%@", [file description]);
    }
    */
    
    //The JSON being returned was returning an array of arrays, get the [0]th element
    self.topics = ((NSArray *)[NSJSONSerialization JSONObjectWithData: [file dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil])[0];
    
    self.tblTopics.dataSource = self;
    self.tblTopics.delegate = self;
}

- (void) viewWillAppear:(BOOL)animated {
    NSError *error;
    
    //read JSON from URL
    NSURL *url = [NSURL URLWithString:@"http://mobile.sheridanc.on.ca/~woodgre/Ladder/AllTopics.php"];
    NSString *file = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    
    /*
     if (error) {
     NSLog(@"%@",[error description]);
     } else {
     NSLog(@"%@", [file description]);
     }
     */
    
    //The JSON being returned was returning an array of arrays, get the [0]th element
    self.topics = ((NSArray *)[NSJSONSerialization JSONObjectWithData: [file dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil])[0];
    
    [tblTopics reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (IBAction) flipToHome:(id)sender {
    AppDelegate *mainDelegate = [[UIApplication sharedApplication] delegate];
    [mainDelegate flipToTopicsHome];
}

/*
 * We need to get the TopicID of the topic that the user selected to send to the 
 * CommentsViewController. So we get the indexPath row that the user clicked on, compare
 * that to topics array, then from that dictionary get the topic id.
 */
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AppDelegate *mainDelegate = [[UIApplication sharedApplication] delegate];
    NSDictionary *dict = ((NSDictionary *)[self.topics objectAtIndex:indexPath.row]);
    NSInteger *topicID = [((NSString *)[dict objectForKey:@"TopicID"]) integerValue];
    NSString *topicTitle = [dict objectForKey:@"Title"];
    
    NSLog(@"topicTitle in topicsVC: %@", topicTitle);
    
    [mainDelegate flipToComments: topicID titleText: topicTitle];
}

- (IBAction) openWebView: (id) sender {
    AppDelegate *mainDelegate = [[UIApplication sharedApplication] delegate];
    mainDelegate.webVC = [[WebViewController alloc] init];
    
    //Right now this just shows the JSON data. We would actually open the Ladder site here.
    mainDelegate.webVC.url = @"http://mobile.sheridanc.on.ca/~woodgre/Ladder/AllTopics.php";
    mainDelegate.webVC.sentFrom = mainDelegate.topicsVC.view;
    [mainDelegate swapViews:mainDelegate.topicsVC.view goingTo:mainDelegate.webVC.view];
}

- (IBAction)openAddTopic:(id)sender {
    AppDelegate *mainDelegate = [[UIApplication sharedApplication] delegate];
    mainDelegate.addTopicVC = [[AddTopicViewController alloc] init];
    [mainDelegate setupAnimation:FORWARD];
    [mainDelegate swapViews:mainDelegate.topicsVC.view goingTo:mainDelegate.addTopicVC.view];
}

#pragma mark - TableView methods

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.topics count];
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *commentCellIdentifier = @"CommentCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: commentCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:commentCellIdentifier];
    }
    
    NSDictionary *dictionary = (NSDictionary *)[self.topics objectAtIndex:indexPath.row];
    cell.textLabel.text = dictionary[@"Title"];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

@end
