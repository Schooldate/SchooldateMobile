//
//  HomeViewTableCellFull.m
//  SchooldateMobile
//
//  Created by Haoran Guan on 7/23/12.
//  Copyright (c) 2012 Schooldate. All rights reserved.
//

#import "HomeViewTableCellFull.h"

@implementation HomeViewTableCellFull

@synthesize userThumbImageView, postImageView;
@synthesize userNameLabel, agoLabel;
@synthesize postTextView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
