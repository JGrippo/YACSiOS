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
    return [UIFont fontWithName:@"HelveticaNeue-Thin" size:18.0];
}
+(UIFont*) yacsBlackText
{
    return [UIFont fontWithName:@"sans-serif" size:14.0];
}
+(UIFont*) yacsTitleText
{
    return [UIFont fontWithName:@"Helvetica" size:30.0];
}
+(UIFont*) yacsTitleItalicText
{
    return [UIFont fontWithName:@"HelveticaNeue-ThinItalic" size:16.0];
}
+(UIFont*) yacsYACS
{
    return [UIFont fontWithName:@"HelveticaNeue-Thin" size:30.0];
}

@end
