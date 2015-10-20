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

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 16;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YACatalogTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YACatalogTableViewCell class])];
    
    if(!cell)
    {
        cell = [[YACatalogTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([YACatalogTableViewCell class])];
    }
    
    cell.boldTextField.attributedPlaceholder =[[NSAttributedString alloc] initWithString:@"MAJR" attributes:@{NSForegroundColorAttributeName: [UIColor yacsBlackTitle]}];
    [[cell boldTextField] setFont:[UIFont yacsBoldText]];
    
    cell.descriptionTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"This is your major" attributes:@{NSForegroundColorAttributeName: [UIColor yacsBlackTitle]}];
    [[cell descriptionTextField] setFont:[UIFont yacsBlackText]];
    
    // Configure the cell...
    
    return cell;
}






@end
