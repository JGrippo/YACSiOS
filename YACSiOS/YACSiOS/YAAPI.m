//
//  YAAPI.m
//  YACSiOS
//
//  Created by james grippo on 1/28/16.
//  Copyright © 2016 james grippo. All rights reserved.
//

#import "YAAPI.h"

@implementation YAAPI : AFHTTPSessionManager

// This method creates an API object that communicates with the api with different requests. Its how we access the other functions for this class.
+(YAAPI*) API
{
    static YAAPI* netManager = nil;
    dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netManager = [[YAAPI alloc] initWithBaseURL:[NSURL URLWithString:@"https://yacs.cs.rpi.edu"]];
        netManager.responseSerializer = [[AFJSONResponseSerializer alloc] init];
        netManager.responseSerializer.acceptableContentTypes = [netManager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
        
    });
    return netManager;
}

// This is the API request for getting the departments, schools, etc for the catalog view.
// The format of the resonse object should be a dictionary with the Keys in this order : "schools" -> "departments" -> other attributes such as "code"/"name"/"id"
-(void) getDepartments:(void (^)(NSDictionary *))completion
{
    [self GET:@"/api/v5/schools.json?&show_departments" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        completion(responseObject);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"WOW IT FAILED.");
        completion(nil);
    }];
}

// This is the API request to get a dictionary of each section in the format : "courses" -> "sections" -> other attributes "seats" / "seats taken" / "instructor"
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
