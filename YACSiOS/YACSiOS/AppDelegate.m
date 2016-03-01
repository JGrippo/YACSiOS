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
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //self.window.tintColor = [UIColor yacsBlackTitle];
    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(100, 100);
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    YACatalogViewController* catalogvc = [[YACatalogViewController alloc] init];
    YACalanderCollectionViewController* calandervc = [[YACalanderCollectionViewController alloc] initWithCollectionViewLayout:flowLayout];
    
    UITabBarController* tbvc = [[UITabBarController alloc] init];

    [tbvc setViewControllers:@[
                                                    [[UINavigationController alloc] initWithRootViewController:catalogvc],
                                                    [[UINavigationController alloc] initWithRootViewController:calandervc]] animated:YES];
    [tbvc setTitle:@"YACS"];
    [UINavigationBar appearance].barTintColor = [UIColor yacsRedHighlight];
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor yacsBlackTitle], NSFontAttributeName:[UIFont yacsTitleText]}];
    [[UITabBar appearance] setBarTintColor:[UIColor yacsBackground]];
    [[UITabBar appearance] setTintColor:[UIColor yacsBlackText]];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIColor yacsBlackText], NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    // set color of unselected text to green
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor yacsRedHighlight], NSForegroundColorAttributeName, nil]
                                             forState:UIControlStateNormal];
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:tbvc];
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Split view
/*
- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    if ([secondaryViewController isKindOfClass:[UINavigationController class]] && [[(UINavigationController *)secondaryViewController topViewController] isKindOfClass:[DetailViewController class]] && ([(DetailViewController *)[(UINavigationController *)secondaryViewController topViewController] detailItem] == nil)) {
        // Return YES to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
        return YES;
    } else {
        return NO;
    }
} */

@end
