//
//  YAAPI.m
//  YACSiOS
//
//  Created by james grippo on 1/28/16.
//  Copyright © 2016 james grippo. All rights reserved.
//

#import "YAAPI.h"

@implementation YAAPI : AFHTTPSessionManager

+(YAAPI*) API
{
    static YAAPI* netManager = nil;
    dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netManager = [[YAAPI alloc] initWithBaseURL:[NSURL URLWithString:@"http://localhost:3000"]];
        netManager.responseSerializer = [[YAHTTPResponseSerializer alloc] init];
        
    });
    return netManager;
}

-(void) getDepartments:(void (^)(NSArray *))completion
{
    [self GET:@"/api/v5/departments.json" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSLog(@"SUCESS!");
        completion(responseObject);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"WOW IT FAILED.");
        completion(nil);
    }];
}
@end
