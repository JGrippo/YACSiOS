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

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 15;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YASelectionTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YASelectionTableViewCell class])];
    
    if (!cell)
    {
        cell = [[YASelectionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([YASelectionTableViewCell class])];
    }
    
    if(indexPath.row % 5 == 0)
    {
        cell.textField.text = @"Pretend";
    }
    if(indexPath.row % 5 == 1)
    {
        cell.textField.text = @"There";
    }
    if(indexPath.row % 5 == 2)
    {
        cell.textField.text = @"Are";
    }
    if(indexPath.row % 5 == 3)
    {
        cell.textField.text = @"Courses";
    }
    if(indexPath.row % 5 == 4)
    {
        cell.textField.text = @"Here";
    }
    // Configure the cell...
    
    return cell;
}




@end
