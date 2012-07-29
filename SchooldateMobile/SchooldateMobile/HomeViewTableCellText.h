//
//  HomeViewTableCellText.h
//  SchooldateMobile
//
//  Created by Haoran Guan on 7/23/12.
//  Copyright (c) 2012 Schooldate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewTableCellText : UITableViewCell

@property (nonatomic, retain) IBOutlet UIImageView *userThumbImageView;
@property (nonatomic, retain) IBOutlet UILabel *userNameLabel;
@property (nonatomic, retain) IBOutlet UITextView *postTextView;
@property (nonatomic, retain) IBOutlet UILabel *agoLabel;

@end
