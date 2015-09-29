//
//  YATabBarController.h
//  YACSiOS
//
//  Created by james grippo on 9/28/15.
//  Copyright © 2015 james grippo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YACatalogViewController.h"
#import "YACalanderCollectionViewController.h"
#import "YASelectionTableViewController.h"

@interface YATabBarController : UITabBarController

@property (strong, nonatomic) NSMutableArray* TabBarViewControllers;

@end
