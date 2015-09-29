//
//  YATabBarController.m
//  YACSiOS
//
//  Created by james grippo on 9/28/15.
//  Copyright © 2015 james grippo. All rights reserved.
//

#import "YATabBarController.h"

@interface YATabBarController ()


@end

@implementation YATabBarController

@synthesize TabBarViewControllers;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Initializing the view controllers for the tab view controller.
    TabBarViewControllers = [NSMutableArray arrayWithObjects:
                                      [[YACatalogViewController alloc] init],
                                      [[YACalanderCollectionViewController alloc] init],
                                      [[YASelectionTableViewController alloc] init], nil];
    
    // Here you can add custom tab bar items for each view controller.

    self.viewControllers = TabBarViewControllers;
    [self.navigationController setViewControllers:[NSArray arrayWithArray:TabBarViewControllers] animated:YES];
}

//-(void) setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers animated:(BOOL)animated
//{
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
