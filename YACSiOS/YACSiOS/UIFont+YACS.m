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
    return [UIFont fontWithName:@"Helvetica-Bold" size:[UIFont systemFontSize]];
}
+(UIFont*) yacsBlackText
{
    return [UIFont fontWithName:@"sans-serif" size:[UIFont systemFontSize]];
}

@end
