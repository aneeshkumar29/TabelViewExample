//
//  CustomCell.m
//  FaststreamTest
//
//  Created by Dev009 on 1/13/15.
//  Copyright (c) 2015 Dev009. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize cellLabel, cellImage;

- (void)awakeFromNib
{
    // Initialization code
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
