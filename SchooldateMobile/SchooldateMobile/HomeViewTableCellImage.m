//
//  HomeViewTableCellImage.m
//  SchooldateMobile
//
//  Created by Haoran Guan on 7/23/12.
//  Copyright (c) 2012 Schooldate. All rights reserved.
//

#import "HomeViewTableCellImage.h"

@implementation HomeViewTableCellImage

@synthesize userThumbImageView, postImageView;
@synthesize userNameLabel, agoLabel;

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
