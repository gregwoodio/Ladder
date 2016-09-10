//
//  CommentsViewController.m
//  LadderTest
//
//  Created by iOS Xcode User on 2016-03-15.
//  Copyright © 2016 Greg Wood. All rights reserved.
//


/*
 Author: Greg Wood
 This is the m file for the Comments View
 This m file will display all the comments in a Topics
 
 
 */

#import "CommentsViewController.h"
#import "AppDelegate.h"
#import "CommentTableViewCell.h"

@interface CommentsViewController ()

@end

@implementation CommentsViewController

@synthesize commentsArray, navbar, tblComments, topicID, titleText;

/*
 Author: Greg Wood
 
 
 
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSError *error;
    
    //read JSON from URL (%zd for unsigned int)
    NSString *urlWithTopic = [NSString stringWithFormat: @"http://laddr.xyz/api/topic?TopicID=%zd", self.topicID];
    
    //make HTTP request
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] init];
    [req setURL: [NSURL URLWithString: urlWithTopic]];
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

    //read JSON data into array    
    self.commentsArray = (NSArray *)[NSJSONSerialization JSONObjectWithData: jsonData options:0 error:nil];
    
    NSLog(@"titleText: %@", titleText);
    
    navbar.topItem.title = titleText;
    
    //NSLog(@"%@", [self.commentsArray description] );
    
    //don't forget this stuff!
    self.tblComments.dataSource = self;
    self.tblComments.delegate = self;

}


/*
 Author: Greg Wood
 
 
 
 */
- (void) viewWillAppear:(BOOL)animated {
    
    [tblComments reloadData];
    
}

/*
 Author: Greg Wood
 
 
 
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView methods


/*
 Author: Greg Wood
 Method taught in class to give the cell a size.
 
 
 */
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //TODO: Make this a variable height depending on comment length
    return 120;
}

/*
 Author: Greg Wood
 Method returns the numbers of rows that exist.
 
 
 */
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.commentsArray count];
}



/*
 Author: Greg Wood
 This method will populate the cell with the comment and the author of the comment.
 This is populated through the information from that is obtained in the JSON callback.
 */
- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *simpleTableIdentifier = @"CommentCell";
    CommentTableViewCell *cell = (CommentTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"CommentTableViewCell" owner:self options:nil];
        cell = [nibArray objectAtIndex:0];
    }
    
    NSDictionary *dict = (NSDictionary *)[self.commentsArray objectAtIndex:indexPath.row];
    cell.author.text = dict[@"Author"];
    cell.body.text = dict[@"Body"];
    [cell.body sizeToFit]; //top left align text
    
    //TODO: Add avatar image to view
    //cell.avatar.image = dict[@"Image"];
    
    return cell;
}

#pragma mark - Navigation


/*
 Author: Greg Wood
 Transitions the view to Topics View.
 
 
 */
- (IBAction)returnToTopics: (id)sender {
    AppDelegate *mainDelegate = [[UIApplication sharedApplication] delegate];
    [mainDelegate flipToCommentsBack];
}



/*
 Author: Greg Wood
 This method will transition the view to Add Comments view while tracking the topic id and title should the user submit the comment.
 */
- (IBAction)openAddComment:(id)sender {
    AppDelegate *mainDelegate = [[UIApplication sharedApplication] delegate];
    mainDelegate.addCommentVC = [[AddCommentViewController alloc] init];
    mainDelegate.addCommentVC.topicID = topicID;
    mainDelegate.addCommentVC.topicTitle = titleText;
    [mainDelegate setupAnimation:FORWARD];
    [mainDelegate swapViews:mainDelegate.commentsVC.view goingTo:mainDelegate.addCommentVC.view];
}



/*
 Author: Greg Wood
 

 */
- (IBAction) openWebView: (id) sender {
    AppDelegate *mainDelegate = [[UIApplication sharedApplication] delegate];
    mainDelegate.webVC = [[WebViewController alloc] init];
    
    //Right now this just shows the JSON data. We would actually open the Ladder site here.
    NSString *urlWithTopic = [NSString stringWithFormat: @"http://mobile.sheridanc.on.ca/~woodgre/Ladder/Topic.php?TopicID=%zd", self.topicID];
    mainDelegate.webVC.url = urlWithTopic;
    mainDelegate.webVC.sentFrom = mainDelegate.topicsVC.view;
    [mainDelegate swapViews:mainDelegate.topicsVC.view goingTo:mainDelegate.webVC.view];
}

@end
