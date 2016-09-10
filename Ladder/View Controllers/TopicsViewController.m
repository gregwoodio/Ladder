//
//  TopicsViewController.m
//  LadderTest
//
//  Created by iOS Xcode User on 2016-03-15.
//  Copyright © 2016 Greg Wood. All rights reserved.
//

/*
 Author: Greg Wood
 
 
 
 */

#import "TopicsViewController.h"
#import "AppDelegate.h"

@interface TopicsViewController ()

@end

@implementation TopicsViewController

@synthesize topics, tblTopics;

#pragma mark - View Methods


/*
 Author: Greg Wood
 
 On load, this method will fill the topics array with all the names of the topics using the json call.
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //TODO: Fix crashes when JSON can't be found.
    NSError *error;

    //make HTTP request
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] init];
    NSString *url = [NSString stringWithFormat:@"http://laddr.xyz/api/topic"];
    [req setURL: [NSURL URLWithString: url]];
    [req setHTTPMethod:@"GET"];
    [req setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    //set token as header
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [req setValue: mainDelegate.token forHTTPHeaderField:@"x-access-token"];
 
    //make a synchronous URLConnection
    //TODO: All requests should be asynchronous
    NSURLResponse *res = nil;
    NSError *err = nil;
    NSData *jsonData = [NSURLConnection sendSynchronousRequest:req returningResponse:&res error:&err];
    
    //The JSON being returned was returning an array of arrays, get the [0]th element
    self.topics = (NSArray *)[NSJSONSerialization JSONObjectWithData: jsonData options:0 error:nil];
    
    self.tblTopics.dataSource = self;
    self.tblTopics.delegate = self;
}


/*
 Author: Greg Wood
 
*/

- (void) viewWillAppear:(BOOL)animated {
    NSError *error;
    
    //make HTTP request
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] init];
    NSString *url = [NSString stringWithFormat:@"http://laddr.xyz/api/topic"];
    [req setURL: [NSURL URLWithString: url]];
    [req setHTTPMethod:@"GET"];
    [req setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    //set token as header
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [req setValue: mainDelegate.token forHTTPHeaderField:@"x-access-token"];
 
    //make a synchronous URLConnection
    //TODO: All requests should be asynchronous
    NSURLResponse *res = nil;
    NSError *err = nil;
    NSData *jsonData = [NSURLConnection sendSynchronousRequest:req returningResponse:&res error:&err];
    
    //The JSON being returned was returning an array of arrays, get the [0]th element
    self.topics = (NSArray *)[NSJSONSerialization JSONObjectWithData: jsonData options:0 error:nil];
    
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
 Author: Greg Wood
 
*/

/*
 * We need to get the TopicID of the topic that the user selected to send to the 
 * CommentsViewController. So we get the indexPath row that the user clicked on, compare
 * that to topics array, then from that dictionary get the topic id.
 */
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AppDelegate *mainDelegate = [[UIApplication sharedApplication] delegate];
    NSDictionary *dict = ((NSDictionary *)[self.topics objectAtIndex:indexPath.row]);
    NSInteger topicID = [([dict objectForKey:@"TopicID"]) integerValue];
    NSString *topicTitle = [dict objectForKey:@"Title"];
    
    NSLog(@"topicTitle in topicsVC: %@", topicTitle);
    
    [mainDelegate flipToComments: topicID titleText: topicTitle];
}

/*
 Author: Greg Wood
 
 */


- (IBAction) openWebView: (id) sender {
    AppDelegate *mainDelegate = [[UIApplication sharedApplication] delegate];
    mainDelegate.webVC = [[WebViewController alloc] init];
    
    //Right now this just shows the JSON data. We would actually open the Ladder site here.
    mainDelegate.webVC.url = @"http://mobile.sheridanc.on.ca/~woodgre/Ladder/AllTopics.php";
    mainDelegate.webVC.sentFrom = mainDelegate.topicsVC.view;
    [mainDelegate swapViews:mainDelegate.topicsVC.view goingTo:mainDelegate.webVC.view];
}


/*
 Author: Greg Wood
 
 Method will transistion current view to Add Topic view.
 */

- (IBAction)openAddTopic:(id)sender {
    AppDelegate *mainDelegate = [[UIApplication sharedApplication] delegate];
    mainDelegate.addTopicVC = [[AddTopicViewController alloc] init];
    [mainDelegate setupAnimation:FORWARD];
    [mainDelegate swapViews:mainDelegate.topicsVC.view goingTo:mainDelegate.addTopicVC.view];
}

#pragma mark - TableView methods


/*
 Author: Greg Wood
 
 Method taught in class for Tables
 
 */

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.topics count];
}


/*
 Author: Greg Wood
 
 Method taught in class for Tables
 */

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}


/*
 Author: Greg Wood
 
 Method taught in class for Tables
 */

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
