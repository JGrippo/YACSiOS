//
//  YACatalogViewController.m
//  YACSiOS
//
//  Created by james grippo on 9/27/15.
//  Copyright © 2015 james grippo. All rights reserved.
//

#import "YACatalogViewController.h"

@interface YACatalogViewController ()

@property NSArray* departments;
@end

@implementation YACatalogViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchDepartments];
    
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
        [[self tableView] setBackgroundColor:[UIColor yacsBackground]];
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
    
    cell.backgroundColor = [UIColor yacsBackground];
    
    cell.boldTextField.attributedPlaceholder =[[NSAttributedString alloc] initWithString:@"MAJR" attributes:@{NSForegroundColorAttributeName: [UIColor yacsBlackTitle]}];
    [[cell boldTextField] setFont:[UIFont yacsBoldText]];
    
    cell.descriptionTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"This is your major" attributes:@{NSForegroundColorAttributeName: [UIColor yacsBlackTitle]}];
    [[cell descriptionTextField] setFont:[UIFont yacsBlackText]];
    
    // Configure the cell...
    
    return cell;
}

-(void) fetchDepartments
{
    [[YAAPI API] getDepartments:^(NSArray *departments){
        self.departments = departments;
        [self.tableView reloadData];
    }];
}



@end
