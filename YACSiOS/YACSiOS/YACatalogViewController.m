//
//  YACatalogViewController.m
//  YACSiOS
//
//  Created by james grippo on 9/27/15.
//  Copyright © 2015 james grippo. All rights reserved.
//

#import "YACatalogViewController.h"

@interface YACatalogViewController ()

@property NSDictionary* departments;
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

    if (_departments == nil)
        return 1;
    else
      return [_departments[@"schools"] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (_departments == nil)
        return 1;
    else
        return [[[[_departments valueForKey:@"schools"] objectAtIndex:section] valueForKey:@"departments"] count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (_departments == nil)
        return @"loading";
    else
        return [[[_departments valueForKey:@"schools"] objectAtIndex:section] valueForKey:@"name"];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YACatalogTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YACatalogTableViewCell class])];
    
    if(!cell)
    {
        cell = [[YACatalogTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([YACatalogTableViewCell class])];
    }
    if (_departments == nil)
        return cell;
        
    else
    {
        cell.backgroundColor = [UIColor yacsBackground];

        cell.boldTextField.attributedPlaceholder =
        [[NSAttributedString alloc] initWithString: [[[[[_departments valueForKey:@"schools"] objectAtIndex:indexPath.section] valueForKey:@"departments"] objectAtIndex:indexPath.row] valueForKey:@"code"]
                                        attributes: @{NSForegroundColorAttributeName: [UIColor yacsBlackTitle]}];
        
        [[cell boldTextField] setFont:[UIFont yacsBoldText]];
        
        cell.descriptionTextField.attributedPlaceholder =
        [[NSAttributedString alloc] initWithString: [[[[[_departments valueForKey:@"schools"] objectAtIndex:indexPath.section] valueForKey:@"departments"] objectAtIndex:indexPath.row] valueForKey:@"name"]
                                        attributes: @{NSForegroundColorAttributeName: [UIColor yacsBlackTitle]}];
        [[cell descriptionTextField] setFont:[UIFont yacsBlackText]];
        
        return cell;
    }
}

-(void) fetchDepartments
{
    [[YAAPI API] getDepartments:^(NSArray *departments){
        self.departments = departments;
        [self.tableView reloadData];
    }];
}



@end
