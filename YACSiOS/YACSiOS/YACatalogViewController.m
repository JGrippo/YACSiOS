//
//  YACatalogViewController.m
//  YACSiOS
//
//  Created by james grippo on 9/27/15.
//  Copyright © 2015 james grippo. All rights reserved.
//

#import "YACatalogViewController.h"

@interface YACatalogViewController ()


@end

@implementation YACatalogViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark -Catalog Table View Init

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [[self tableView] setDelegate:self];
        [[self tableView] setDataSource:self];
        [[self tableView] registerClass:[YACatalogTableViewCell class] forCellReuseIdentifier:NSStringFromClass([YACatalogViewController class])];
        self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:(UITabBarSystemItemSearch) tag:0];
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Catalog Table view data source

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
