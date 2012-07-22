//
//  MenuViewTableCell.m
//  SchooldateMobile
//
//  Created by Haoran Guan on 7/19/12.
//  Copyright (c) 2012 NYU. All rights reserved.
//

#import "MenuViewTableCell.h"

@implementation MenuViewTableCell

@synthesize cellImageView;
@synthesize cellTextLabel;

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
