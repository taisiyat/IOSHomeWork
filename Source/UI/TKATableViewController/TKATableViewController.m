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
//        [tableView deleteRowsAtIndexPaths:@[indexPath]
//                         withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    if (UITableViewCellEditingStyleInsert) {
        [self.users addUser:[TKAUser new] atIndex:indexPath.row];
        //        [tableView insertRowsAtIndexPaths:@[indexPath]
        //                         withRowAnimation:UITableViewRowAnimationAutomatic];
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
    
//    UITableView *usersTable = self.tableView.usersTableView;
//    NSUInteger indexRow = [users countOfUsers] - 1;
//    [usersTable insertRowsAtIndexPaths:@[[usersTable indexPathForRow:indexRow]]
//                      withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (IBAction)onEditButton:(id)sender {
    TKATableView *table = self.tableView;
    table.editing = !table.editing;
}

#pragma mark -
#pragma mark TKAArrayModelObserver

//- (void)usersArrayDidChange {
//    switch (self.users.state) {
//        case TKAArrayModelAddUser:
//            [self.tableView.usersTableView setEditing:YES animated:YES];
//            break;
//        case TKAArrayModelRemoveUser:
//            [self.tableView.usersTableView setEditing:YES animated:YES];
//            break;
//        default:
//            [self.tableView.usersTableView setEditing:NO animated:NO];
//            break;
//    }
//}

- (void)usersArrayDidChangeObject:(id)user {
    UITableView *usersTable = self.tableView.usersTableView;
    NSUInteger indexRow = 0;
    switch (self.users.state) {
        case TKAArrayModelAddUser:
            [self.tableView setEditing:YES animated:YES];
            indexRow = [self.users countOfUsers] - 1;
//            [usersTable insertRowsAtIndexPaths:@[[usersTable indexPathForRow:indexRow]]
//                              withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case TKAArrayModelRemoveUser:
            [self.tableView setEditing:YES animated:YES];
            indexRow = [self.users indexOfObject:user];
//            [usersTable deleteRowsAtIndexPaths:@[[usersTable indexPathForRow:indexRow]]
//                             withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        default:
            [self.tableView.usersTableView setEditing:NO animated:NO];
            break;
    }
}

@end
