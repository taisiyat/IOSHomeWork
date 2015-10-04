//
//  TKATableViewController.m
//  IOSHomeWork
//
//  Created by Taisiya on 20.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKATableViewController.h"

#import "TKATableView.h"
#import "TKATableCell.h"
#import "TKAUser.h"
#import "TKAUsers.h"

#import "TKAMacros.h"

#import "UITableView+TKAExtension.h"
#import "NSIndexPath+TKAExtension.h"

TKAViewControllerBaseViewProperty(TKATableViewController, tableView, TKATableView)

@implementation TKATableViewController

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.users = nil;
}

- (void)setUsers:(TKAUsers *)users {
    TKASetterWithAddObserver(users);
}


#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView.usersTableView reloadData];
}

- (void)viewDidDisappear:(BOOL)animated {
    [self.users removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 
#pragma mark UITableViewDataSource

- (NSInteger)   tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {

    return [self.users count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TKATableCell *cell = [tableView dequeueCellWithClass:[TKATableCell class]];
 
    cell.user = [self.users unitAtIndex:indexPath.row];
    
    return cell;
}

- (void)     tableView:(UITableView *)tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
     forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.users removeUnitAtIndex:indexPath.row];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        [self.users addUnit:[TKAUser new] atIndex:indexPath.row];
    }
}

- (void)     tableView:(UITableView *)tableView
    moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
           toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self.users moveUnitAtIndex:sourceIndexPath.row
                        toIndex:destinationIndexPath.row];
}

- (BOOL)        tableView:(UITableView *)tableView
    canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0 != indexPath.row;
}

- (BOOL)        tableView:(UITableView *)tableView
    canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0 != indexPath.row;
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onAddButton:(id)sender {
    TKAUsers *users = self.users;
    [users addUnit:[TKAUser user]];
}

- (IBAction)onEditButton:(id)sender {
    TKATableView *table = self.tableView;
    table.editing = !table.editing;
}

#pragma mark -
#pragma mark TKAArrayModelObserver

- (void)arrayModel:(TKAArrayModel *)users didChangeWithObject:(TKAChangeModel *)user {
    UITableView *usersTable = self.tableView.usersTableView;
    switch (self.users.state) {
        case TKAArrayModelChange: {
            [usersTable updateWithChanges:user];
            users.state = TKAArrayModelNotChange;}
            break;
        default:
            break;
    }
}

@end
