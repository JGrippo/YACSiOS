//
//  YAAPI.h
//  YACSiOS
//
//  Created by james grippo on 1/28/16.
//  Copyright © 2016 james grippo. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "YAHTTPResponseSerializer.h"

@interface YAAPI : AFHTTPSessionManager

+(YAAPI*) API;

-(void) getDepartments:(void(^)(NSArray* departments))completion;
@end
