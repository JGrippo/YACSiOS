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

@synthesize courses, depTitle;

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

-(instancetype) initWithDepartmentId:(NSString *) departmentId :(NSString*) departmentTitle
{
    self = [super init];
    if (self)
    {
        
        self.departmentId = departmentId;
        self.depTitle = departmentTitle;
        [[self tableView] setDelegate:self];
        [[self tableView] setDataSource:self];
        [[self tableView] registerClass:[YASelectionTableViewCell class] forCellReuseIdentifier:NSStringFromClass([YASelectionTableViewCell class])];
    }
    [self setTitle:depTitle];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor yacsBackground], NSFontAttributeName:[UIFont yacsYACS]}];
    [self.tableView setSeparatorColor:[UIColor yacsSeparatorColor]];
    [self setNeedsStatusBarAppearanceUpdate];
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
    tempView.backgroundColor=[UIColor yacsDarkBackground];
    
    UILabel *tempLabel=[[UILabel alloc]initWithFrame:CGRectMake(10,-7,300,44)];
    tempLabel.backgroundColor=[UIColor clearColor];
    //tempLabel.shadowColor = [UIColor blackColor];
    //tempLabel.shadowOffset = CGSizeMake(0,2);
    tempLabel.textColor = [UIColor blackColor];
    tempLabel.font = [UIFont yacsHelveticaNeue];
    tempLabel.text=[[[self.courses valueForKey:@"courses"] objectAtIndex:section] valueForKey:@"name"];;
    
    [tempView addSubview:tempLabel];
    
    return tempView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YASelectionTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YASelectionTableViewCell class])];
    
    if (!cell)
    {
        cell = [[YASelectionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([YASelectionTableViewCell class])];
    }
    
    if (self.courses == nil)
        return cell;
    
    NSNumber* num1 = [[[[[self.courses valueForKey:@"courses"] objectAtIndex:indexPath.section ] valueForKey:@"sections"] objectAtIndex:indexPath.row] valueForKey:@"seats"];
    
    NSNumber* num2 = [[[[[self.courses valueForKey:@"courses"] objectAtIndex:indexPath.section ] valueForKey:@"sections"] objectAtIndex:indexPath.row] valueForKey:@"seats_taken"];
    
    NSArray* instructors = [[[[[self.courses valueForKey:@"courses"] objectAtIndex:indexPath.section ] valueForKey:@"sections"] objectAtIndex:indexPath.row] valueForKey:@"instructors"];
    NSString* instructor;
    
    if(!instructors.count)
    {
        instructor = @"Not Available";
    }
    else
    {
        instructor = [instructors objectAtIndex:0];
    }
    
    NSInteger seats = num1.integerValue-num2.integerValue;
    
    NSString* text =[[NSString alloc] initWithFormat:@"Section %ld Seats %ld - %@", (long)indexPath.row+1, (long)seats, instructor];
    cell.Label.attributedText = [[NSAttributedString alloc] initWithString:text attributes:@{NSForegroundColorAttributeName: [UIColor yacsBlackTitle]}];
    [[cell Label] setFont:[UIFont yacsBlackText]];
    // Configure the cell...
    
    return cell;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void) fetchCourses
{
    [[YAAPI API] getCoursesForDepartment:self.departmentId completion:^(NSDictionary *getCourses) {
        self.courses = getCourses;
        [self.tableView reloadData];
    }];

}


@end
