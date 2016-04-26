//
//  YACatalogSectionHeader.m
//  YACSiOS
//
//  Created by james grippo on 4/26/16.
//  Copyright © 2016 james grippo. All rights reserved.
//

#import "YACatalogSectionHeader.h"

@implementation YACatalogSectionHeader

@synthesize titleLabel;

-(instancetype) init
{
    [super init];
    if (
    UIView *tempView=[[UIView alloc]initWithFrame:CGRectMake(100,300,300,244)];
    tempView.backgroundColor=[UIColor yacsLightGreyText];
    
    UILabel *tempLabel=[[UILabel alloc]initWithFrame:CGRectMake(15,-7,300,44)];
    tempLabel.backgroundColor=[UIColor clearColor];
    //tempLabel.shadowColor = [UIColor blackColor];
    //tempLabel.shadowOffset = CGSizeMake(0,2);
    tempLabel.textColor = [UIColor blackColor];
    tempLabel.font = [UIFont yacsTitleItalicText];
    tempLabel.text=[[[_departments valueForKey:@"schools"] objectAtIndex:section] valueForKey:@"name"];
    
    [tempView addSubview:tempLabel];
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
