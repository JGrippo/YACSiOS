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
@property NSString* department_id;
@end

@implementation YACatalogViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
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
    [self setTitle:@"YACS"];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont yacsYACS], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self setNeedsStatusBarAppearanceUpdate];
    [self.tableView setSeparatorColor:[UIColor yacsSeparatorColor]];
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


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *tempView=[[UIView alloc]initWithFrame:CGRectMake(100,300,300,244)];
    tempView.backgroundColor=[UIColor yacsDarkBackground];
    
    UILabel *tempLabel=[[UILabel alloc]initWithFrame:CGRectMake(15,-7,300,44)];
    tempLabel.backgroundColor=[UIColor clearColor];
    //tempLabel.shadowColor = [UIColor blackColor];
    //tempLabel.shadowOffset = CGSizeMake(0,2);
    tempLabel.textColor = [UIColor blackColor];
    tempLabel.font = [UIFont yacsBoldItalic];
    tempLabel.text=[[[_departments valueForKey:@"schools"] objectAtIndex:section] valueForKey:@"name"];
    
    [tempView addSubview:tempLabel];
    
    return tempView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
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

        cell.boldLabel.attributedText =
        [[NSAttributedString alloc] initWithString: [[[[[_departments valueForKey:@"schools"] objectAtIndex:indexPath.section] valueForKey:@"departments"] objectAtIndex:indexPath.row] valueForKey:@"code"]
                                        attributes: @{NSForegroundColorAttributeName: [UIColor yacsBlackTitle]}];
        
        [[cell boldLabel] setFont:[UIFont yacsBoldText]];
        
        cell.descriptionLabel.attributedText =
        [[NSAttributedString alloc] initWithString: [[[[[_departments valueForKey:@"schools"] objectAtIndex:indexPath.section] valueForKey:@"departments"] objectAtIndex:indexPath.row] valueForKey:@"name"]
                                        attributes: @{NSForegroundColorAttributeName: [UIColor yacsBlackTitle]}];
        [[cell descriptionLabel] setFont:[UIFont yacsBlackText]];
        
        return cell;
    }
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* departmentId = [[[[[_departments valueForKey:@"schools"] objectAtIndex:indexPath.section] valueForKey:@"departments"] objectAtIndex:indexPath.row] valueForKey:@"id"];
    NSString* title = [[[[[_departments valueForKey:@"schools"] objectAtIndex:indexPath.section] valueForKey:@"departments"] objectAtIndex:indexPath.row] valueForKey:@"code"];
    YASelectionTableViewController* selvc = [[YASelectionTableViewController alloc] initWithDepartmentId: departmentId :title];
    
    [self.navigationController pushViewController:selvc animated:YES];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(void) fetchDepartments
{
    [[YAAPI API] getDepartments:^(NSDictionary *departments){
        self.departments = departments;
        [self.tableView reloadData];
    }];
}



@end
