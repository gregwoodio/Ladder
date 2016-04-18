//
//  AllPostingsViewController.m
//  Ladder
//
//  Created by iOS Xcode User on 2016-04-13.
//  Copyright © 2016 Codebusters. All rights reserved.
//



/*  Author : Peter
 *  AllPostingsVC.m uses a JSON call to populate the tableview with all possible postings.
 *  Each posting is clickable, and will transition to the ViewPostingsVC showing all relevant data.
 *  The user has the option to create their own posting as well.
 */


#import "AllPostingsViewController.h"
#import "AppDelegate.h"



@interface AllPostingsViewController ()

@end

@implementation AllPostingsViewController
@synthesize tableView;


#pragma mark - Peter's Methods



/*  Author : Alan
 *  Method transitions AllPostingsVC to DashboardVC
 *
 */

-(IBAction)goToDashFromPostings:(id)sender
{
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [mainDelegate transToDashFromPostings];
}

/*  Author : Peter
 *  Method taught in class to determine how many rows exists.
 */

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    return [mainDelegate.postings count];
}

/*  Author : Peter
 *  Method taught in class to give size of a cell.
 */

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

/*  Author : Peter
 *  Method creates the cells and builds the insides of them.
 */

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSString *cellIdentifier = @"Cell";
    
    SiteCell *cell = (SiteCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[SiteCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSInteger row = indexPath.row;
    
    Posting *p = [mainDelegate.postings objectAtIndex:row];
    
    cell.primaryLabel.text = p.jobTitle;
    cell.secondaryLabel.text = p.organizerName;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

/*  Author : Peter
 *  Method will transition from selected cell to the ViewPostingsVC filled with relevant data.
 */

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    mainDelegate.selectedPost = indexPath.row;
    
    [mainDelegate flipToDetailedPosting];
}

/*  Author : Alan
 *  Method transitions AllPostingsVC to CreatePostingsVC
 */

-(IBAction)goToCreatePostings:(id)sender
{
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [mainDelegate flipToCreatePostings];
}

/*  Author : Peter
 *
 *
 *
 */

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
