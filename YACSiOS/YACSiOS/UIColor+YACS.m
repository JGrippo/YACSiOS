//
//  UIColor+YACS.m
//  YACSiOS
//
//  Created by james grippo on 10/18/15.
//  Copyright © 2015 james grippo. All rights reserved.
//

#import "UIColor+YACS.h"

@implementation UIColor (YACS)

+(UIColor*) yacsBlackTitle
{
    return [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
}
+(UIColor*) yacsBlackText
{
    return [UIColor colorWithRed:.27 green:.27 blue:.27 alpha:1];
}
+(UIColor*) yacsGreyText
{
    return [UIColor colorWithRed:.33 green:.33 blue:.33 alpha:1];
}
+(UIColor*) yacsLightGreyText
{
    return [UIColor colorWithRed:.67 green:.67 blue:.67 alpha:1];
}
+(UIColor*) yacsBackground
{
    return [UIColor colorWithRed:.94 green:.94 blue:.94 alpha:1];
}
+(UIColor*) yacsRedHighlight
{
    return [UIColor colorWithRed:.6 green:.2 blue:.2 alpha:1];
}
+(UIColor*) yacsRedText
{
    return [UIColor colorWithRed:.8 green:.33 blue:.33 alpha:1];
}
+(UIColor*) yacsDarkRedText
{
    return [UIColor colorWithRed:.47 green:.07 blue:.06 alpha:1];
}


@end


