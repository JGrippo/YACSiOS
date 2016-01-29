//
//  YAHTTPResponseSerializer.m
//  YACSiOS
//
//  Created by james grippo on 1/28/16.
//  Copyright © 2016 james grippo. All rights reserved.
//

#import "YAHTTPResponseSerializer.h"

@implementation YAHTTPResponseSerializer

-(instancetype) init
{
    self = [super init];
    if(self)
    {
        self.acceptableContentTypes = [self.acceptableContentTypes setByAddingObject:@"text/html"];
    }
    return self;
}

@end
