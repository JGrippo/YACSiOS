//
//  YACatalogViewController.h
//  YACSiOS
//
//  Created by james grippo on 9/27/15.
//  Copyright © 2015 james grippo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YACatalogTableViewCell.h"
#import "YASelectionTableViewController.h"
#import "UIFont+YACS.h"
#import "UIColor+YACS.h"
#import "YAAPI.h"

@interface YACatalogViewController : UITableViewController

@property (strong, nonatomic) UITabBarItem* CatalogTabBarItem;

-(void) fetchDepartments;


@end
