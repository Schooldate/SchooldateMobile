//
//  MenuViewController.h
//  SchooldateMobile
//
//  Created by Haoran Guan on 7/17/12.
//  Copyright (c) 2012 NYU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "MenuViewTableCell.h"

@interface MenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *menuItems;

@end
