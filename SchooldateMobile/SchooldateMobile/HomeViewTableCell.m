//
//  HomeViewTableCell.m
//  SchooldateMobile
//
//  Created by Haoran Guan on 7/20/12.
//  Copyright (c) 2012 Schooldate. All rights reserved.
//

#import "HomeViewTableCell.h"

@implementation HomeViewTableCell

@synthesize userNameLabel, agoLabel;
@synthesize userThumbImageView, postImageView;
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
