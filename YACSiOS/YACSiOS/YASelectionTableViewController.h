//
//  YASelectionTableViewController.h
//  YACSiOS
//
//  Created by james grippo on 9/28/15.
//  Copyright © 2015 james grippo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YASelectionTableViewCell.h"
#import "YACatalogTableViewCell.h"
#import "UIFont+YACS.h"
#import "UIColor+YACS.h"
#import "YAAPI.h"

@interface YASelectionTableViewController : UITableViewController

@property (nonatomic) NSDictionary* courses;
@property (nonatomic) NSString* departmentId;
-(instancetype) initWithDepartmentId:(NSString *)departmentId;
-(void) fetchCourses;

@end
