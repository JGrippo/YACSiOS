//
//  YASelectionTableViewController.m
//  YACSiOS
//
//  Created by james grippo on 9/28/15.
//  Copyright © 2015 james grippo. All rights reserved.
//

#import "YASelectionTableViewController.h"

@interface YASelectionTableViewController ()

@end

@implementation YASelectionTableViewController

@synthesize SelectionTabBarItem;

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Selection Table View Init
-(instancetype) init
{
    self = [super init];
    if (self)
    {
        [[self tableView] setDelegate:self];
        [[self tableView] setDataSource:self];
        [[self tableView] registerClass:[YASelectionTableViewCell class] forCellReuseIdentifier:NSStringFromClass([YASelectionTableViewCell class])];
        
        self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:2];
        
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Selection Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}




@end
