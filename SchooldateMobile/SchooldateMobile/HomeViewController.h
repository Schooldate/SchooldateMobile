//
//  HomeViewController.h
//  SchooldateMobile
//
//  Created by Haoran Guan on 7/18/12.
//  Copyright (c) 2012 NYU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "constans.h"
#import "ASIHTTPRequest.h"
#import "EGORefreshTableHeaderView.h"
#import "HomeViewTableCell.h"

@interface HomeViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, ASIHTTPRequestDelegate, EGORefreshTableHeaderDelegate>
{
    EGORefreshTableHeaderView *_refreshHeaderView;
	
	//  Reloading var should really be your tableviews datasource
	//  Putting it here for demo purposes 
	BOOL _reloading;
    NSArray *tableArray;
}

@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityIndicatorView;

- (IBAction)revealMenu:(id)sender;

- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;

@end
