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

@synthesize courses;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchCourses];
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
        
    }
    return self;
}

-(instancetype) initWithDepartmentId:(NSString *) departmentId
{
    self = [super init];
    if (self)
    {
        
        self.departmentId = departmentId;
        [[self tableView] setDelegate:self];
        [[self tableView] setDataSource:self];
        [[self tableView] registerClass:[YASelectionTableViewCell class] forCellReuseIdentifier:NSStringFromClass([YASelectionTableViewCell class])];
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Selection Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if(courses ==nil)
        return 1;
    else
        return [[courses valueForKey:@"courses"] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(courses ==nil)
        return 1;
    else
        return [[[[courses valueForKey:@"courses"] objectAtIndex:section] valueForKey:@"sections"] count];
}

-(UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *tempView=[[UIView alloc]initWithFrame:CGRectMake(100,300,300,244)];
    tempView.backgroundColor=[UIColor yacsLightGreyText];
    
    UILabel *tempLabel=[[UILabel alloc]initWithFrame:CGRectMake(15,-7,300,44)];
    tempLabel.backgroundColor=[UIColor clearColor];
    //tempLabel.shadowColor = [UIColor blackColor];
    //tempLabel.shadowOffset = CGSizeMake(0,2);
    tempLabel.textColor = [UIColor blackColor];
    tempLabel.font = [UIFont yacsTitleItalicText];
    tempLabel.text=@"hi";
    
    [tempView addSubview:tempLabel];
    
    return tempView;
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

- (void) fetchCourses
{
    [[YAAPI API] getCoursesForDepartment:self.departmentId completion:^(NSDictionary *getCourses) {
        self.courses = getCourses;
        [self.tableView reloadData];
    }];

}


@end
