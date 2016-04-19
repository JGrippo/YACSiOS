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
        netManager = [[YAAPI alloc] initWithBaseURL:[NSURL URLWithString:@"https://yacs.cs.rpi.edu"]];
        netManager.responseSerializer = [[YAHTTPResponseSerializer alloc] init];
        
    });
    return netManager;
}

-(void) getDepartments:(void (^)(NSDictionary *))completion
{
    [self GET:@"/api/v5/schools.json?&show_departments" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        completion(responseObject);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"WOW IT FAILED.");
        completion(nil);
    }];
}
-(void) getCoursesForDepartment:(NSNumber*) department_id completion:(void (^)(NSDictionary *))completion
{
    NSString* url = [NSString stringWithFormat:@"/api/v5/courses.json?department_id=%@&show_sections", department_id];
    
    [self GET:url parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        completion(responseObject);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"WOW IT FAILED.");
        completion(nil);
    }];
}

@end
