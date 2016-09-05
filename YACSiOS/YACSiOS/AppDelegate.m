//
//  AppDelegate.m
//  YACSiOS
//
//  Created by james grippo on 9/20/15.
//  Copyright © 2015 james grippo. All rights reserved.
//

#import "AppDelegate.h"
#import "YACatalogViewController.h"
#import "YACalanderCollectionViewController.h"
#import "YASelectionTableViewController.h"


@interface AppDelegate () <UISplitViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // initiate the first window.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Create the layout for our collection view.
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(100, 100);
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    // Catalog view controller is the table view controller that contains the department name within each school section.
    YACatalogViewController* catalogvc = [[YACatalogViewController alloc] init];
    
    // Calander view controller is the view controller that contains the collection view for the schedule.
    YACalanderCollectionViewController* calandervc = [[YACalanderCollectionViewController alloc] initWithCollectionViewLayout:flowLayout];
    
    // Here were initiate the tab bar view controller than contains both the collection view ( tab on the right) and the table view controller ( tab on the left)
    UITabBarController* tbvc = [[UITabBarController alloc] init];

    [tbvc setViewControllers:@[
                                                    [[UINavigationController alloc] initWithRootViewController:catalogvc],
                                                    [[UINavigationController alloc] initWithRootViewController:calandervc]] animated:YES];
    [UINavigationBar appearance].barTintColor = [UIColor yacsRedHighlight]; //sets the navigation bar ( the one at the top ) text to red
    [[UINavigationBar appearance] setTranslucent:NO]; // Keeps the navigation bar visible.
    [[UITabBar appearance] setBarTintColor:[UIColor yacsBackground]]; // Sets the background of the tab bar view
    [[UITabBar appearance] setTintColor:[UIColor yacsBlackText]]; // Sets the color of the icon to black
    // This sets teh text underneath the icon to red.
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor yacsRedHighlight], NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    // sets teh background of the window to white and displays the tab bar view controller.
    self.window.tintColor = [UIColor whiteColor];
    self.window.rootViewController = tbvc;
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {
}

#pragma mark - Split view


@end
