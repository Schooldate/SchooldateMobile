//
//  HomeViewController.m
//  SchooldateMobile
//
//  Created by Haoran Guan on 7/18/12.
//  Copyright (c) 2012 NYU. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize activityIndicatorView;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (_refreshHeaderView == nil) {
		
		EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height, self.view.frame.size.width, self.tableView.bounds.size.height)];
		view.delegate = self;
		[self.tableView addSubview:view];
		_refreshHeaderView = view;		
	}
	
	//  update the last update date
	[_refreshHeaderView refreshLastUpdatedDate];
    [self loadContent];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [activityIndicatorView startAnimating];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableArray) {
        return [tableArray count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *update = [tableArray objectAtIndex:indexPath.row];
    NSURL *userThumbURL = [NSURL URLWithString:[update objectForKey:@"uthumb"]];
    if ([[update objectForKey:@"post"] isEqualToString:@""]) {
        static NSString *CellIdentifier = @"HomeViewTableCellImage";
        HomeViewTableCellImage *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[HomeViewTableCellImage alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        [cell.userThumbImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:userThumbURL]]];
        cell.userNameLabel.text = [update objectForKey:@"user"];
        
        NSString *postImageURLString = [update objectForKey:@"lobjectp"];
        if ([postImageURLString isEqualToString:@""]) {
            postImageURLString = [update objectForKey:@"lobjectl"];
        }
        if (![postImageURLString isEqualToString:@""]) {
            NSURL *postImageURL = [NSURL URLWithString:postImageURLString];
            [cell.postImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:postImageURL]]];
        }
        
        cell.agoLabel.text = [update objectForKey:@"ago"];
        return cell;
        
    } else if ([[update objectForKey:@"lobjectp"] isEqualToString:@""] && [[update objectForKey:@"lobjectl"] isEqualToString:@""]) {
        static NSString *CellIdentifier = @"HomeViewTableCellText";
        HomeViewTableCellText *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[HomeViewTableCellText alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        [cell.userThumbImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:userThumbURL]]];
        cell.userNameLabel.text = [update objectForKey:@"user"];
        cell.postTextView.text = [update objectForKey:@"post"];
        
        cell.agoLabel.text = [update objectForKey:@"ago"];
        return cell;
        
    } else {
        static NSString *CellIdentifier = @"HomeViewTableCellFull";
        HomeViewTableCellFull *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[HomeViewTableCellFull alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        [cell.userThumbImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:userThumbURL]]];
        cell.userNameLabel.text = [update objectForKey:@"user"];
        cell.postTextView.text = [update objectForKey:@"post"];
        
        NSString *postImageURLString = [update objectForKey:@"lobjectp"];
        if ([postImageURLString isEqualToString:@""]) {
            postImageURLString = [update objectForKey:@"lobjectl"];
        }
        if (![postImageURLString isEqualToString:@""]) {
            NSURL *postImageURL = [NSURL URLWithString:postImageURLString];
            [cell.postImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:postImageURL]]];
        }
        
        cell.agoLabel.text = [update objectForKey:@"ago"];
        return cell;
    }
}

/*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self getCellHeightAtIndex:indexPath.row];
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

- (void)loadContent
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", server, TEST_FILE]];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setDelegate:self];
    [request setDidFinishSelector:@selector(loadContentFinished:)];
    [request setDidFailSelector:@selector(loadContentFailed:)];
    [request startAsynchronous];
}

- (void)loadContentFinished:(ASIHTTPRequest *)request
{
    // Use when fetching text data
    //NSString *responseString = [request responseString];
    NSData *responseData = [request responseData];
    //NSLog(@"%@", responseString);
    
    NSError *error;
    tableArray = [[NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error] objectForKey:@"updates"];
    [activityIndicatorView stopAnimating];
    [self doneLoadingTableViewData];
    [self.tableView reloadData];
}

- (void)loadContentFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
}

#pragma mark -
#pragma mark Data Source Loading / Reloading Methods

- (void)reloadTableViewDataSource{
	
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
	_reloading = YES;
    [self loadContent];
	
}

- (void)doneLoadingTableViewData{
	
	//  model should call this when its done loading
	_reloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
	
}


#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{	
	
	[_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
	
	[_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
	
}


#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	
	[self reloadTableViewDataSource];
	//[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
	
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
	
	return _reloading; // should return if data source model is reloading
	
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	
	return [NSDate date]; // should return date data source was last changed
	
}

#pragma mark -
#pragma mark methods

- (float) getCellHeightAtIndex:(int)row
{
    float height = 238;
    UIFont *font = [UIFont systemFontOfSize:14];
    
    NSString *text = [[tableArray objectAtIndex:row] objectForKey:@"post"];
    CGFloat textHeight = [text sizeWithFont:font].height;
    height = height - 58 + textHeight;
    NSString *postImageURLString = [[tableArray objectAtIndex:row] objectForKey:@"lobjectp"];
    if ([postImageURLString isEqualToString:@""]) {
        postImageURLString = [[tableArray objectAtIndex:row] objectForKey:@"lobjectl"];
    }
    if ([postImageURLString isEqualToString:@""]) {
        height -= 112;
    }
    return height;
}

@end
