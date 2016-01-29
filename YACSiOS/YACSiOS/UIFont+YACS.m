//
//  UIFont+YACS.m
//  YACSiOS
//
//  Created by james grippo on 10/18/15.
//  Copyright © 2015 james grippo. All rights reserved.
//

#import "UIFont+YACS.h"

@implementation UIFont (YACS)

+(UIFont*) yacsBoldText
{
    return [UIFont fontWithName:@"Helvetica" size:18.0];
}
+(UIFont*) yacsBlackText
{
    return [UIFont fontWithName:@"sans-serif" size:[UIFont systemFontSize]];
}
+(UIFont*) yacsTitleText
{
    return [UIFont fontWithName:@"Helvetica" size:30.0];
}

@end
