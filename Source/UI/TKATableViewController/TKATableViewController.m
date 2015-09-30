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

    return [self.users countOfUsers];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TKATableCell *cell = [tableView dequeueCellWithClass:[TKATableCell class]];
 
    cell.user = [self.users userAtIndex:indexPath.row];
    
    return cell;
}

- (void)     tableView:(UITableView *)tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
     forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (UITableViewCellEditingStyleDelete) {
        [self.users removeUserAtIndex:indexPath.row];
    } else if (UITableViewCellEditingStyleInsert) {
        [self.users addUser:[TKAUser new] atIndex:indexPath.row];
    }
}

- (void)     tableView:(UITableView *)tableView
    moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
           toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self.users moveUserAtIndex:sourceIndexPath.row
                        toIndex:destinationIndexPath.row];
}

- (BOOL)        tableView:(UITableView *)tableView
    canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row;
}

- (BOOL)        tableView:(UITableView *)tableView
    canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row;
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onAddButton:(id)sender {
    TKAUsers *users = self.users;
    [users addUser:[TKAUser user]];
}

- (IBAction)onEditButton:(id)sender {
    TKATableView *table = self.tableView;
    table.editing = !table.editing;
}

#pragma mark -
#pragma mark TKAArrayModelObserver

- (void)arrayModel:(id)users didChangeWithObject:(TKAUser *)user {
    UITableView *usersTable = self.tableView.usersTableView;
    NSUInteger indexRow = 0;
    switch (self.users.state) {
        case TKAArrayModelAddChange: {
            indexRow = [self.users countOfUsers] - 1;
            [usersTable insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:indexRow]]
                                  withRowAnimation:UITableViewRowAnimationAutomatic];
        }
            break;
        case TKAArrayModelRemoveChange: {
            indexRow = [self.users indexOfObject:user];
            [usersTable deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:indexRow]]
                             withRowAnimation:UITableViewRowAnimationAutomatic];
        }
            break;
        default:
            self.tableView.editing = NO;
            break;
    }
}

@end
