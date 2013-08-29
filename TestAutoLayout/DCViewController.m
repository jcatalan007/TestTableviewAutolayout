//
//  DCViewController.m
//  TestAutoLayout
//
//  Created by Juan C. Catalan on 8/29/13.
//  Copyright (c) 2013 Decimatica Consulting. All rights reserved.
//

#import "DCViewController.h"

@interface DCViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *dynamicTVHeight;

@end

@implementation DCViewController

#define NUMBER_OF_ROWS 5

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

-(void)viewDidLayoutSubviews
{
    CGFloat height = MIN(self.view.bounds.size.height, self.tableView.contentSize.height);
    self.dynamicTVHeight.constant = height;
    [self.view layoutIfNeeded];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return NUMBER_OF_ROWS;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %u", indexPath.row];
    return cell;
}

@end
