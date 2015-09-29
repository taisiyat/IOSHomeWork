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
    [self.users removeObserver:self];
}

- (void)setUsers:(TKAUsers *)users {
    if (users != _users) {
        _users = users;
        
        if (users != nil) {
            [self.users addObserver:self];
        }
    }
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

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {

    return [self.users countOfUsers];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    TKATableCell *cell = [tableView cellWithClass:[TKATableCell class]];
    cell = [tableView cellIfNotReusableCell:cell withClass:[TKATableCell class]];
   
    cell.user = [self.users userAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
     forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (UITableViewCellEditingStyleDelete) {
        [self.users removeUserAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath]
//                         withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (void)tableView:(UITableView *)tableView
    moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
           toIndexPath:(NSIndexPath *)destinationIndexPath
{
        [self.users moveUserAtIndex:sourceIndexPath.row
                            toIndex:destinationIndexPath.row];
}

- (BOOL)tableView:(UITableView *)tableView
    canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row) {
        return YES;
    }
    
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView
    canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row) {
        return YES;
    }
    
    return NO;
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onAddButton:(id)sender {
    TKAUsers *users = self.users;
    UITableView *usersTable = self.tableView.usersTableView;
    [users addUser:[TKAUser user]];
    
//    NSUInteger indexRow = [users countOfUsers] - 1;
//    [usersTable insertRowsAtIndexPaths:@[[usersTable indexPathForRow:indexRow]]
//                      withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (IBAction)onEditButton:(id)sender {
    TKATableView *table = self.tableView;
    table.editing = !table.editing;
}

#pragma mark -
#pragma mark TKAUsersArrayObserver

//- (void)usersArrayDidChange {
//    switch (self.users.state) {
//        case TKAUsersArrayAddUser:
//            [self.tableView.usersTableView setEditing:YES animated:YES];
//            break;
//        case TKAUsersArrayRemoveUser:
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
        case TKAUsersArrayAddUser:
            [self.tableView setEditing:YES animated:YES];
            indexRow = [self.users countOfUsers] - 1;
            [usersTable insertRowsAtIndexPaths:@[[usersTable indexPathForRow:indexRow]]
                              withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case TKAUsersArrayRemoveUser:
            [self.tableView setEditing:YES animated:YES];
            indexRow = [self.users indexOfObject:user];
            [usersTable deleteRowsAtIndexPaths:@[[usersTable indexPathForRow:indexRow]]
                             withRowAnimation:UITableViewRowAnimationAutomatic];            break;
        default:
            [self.tableView.usersTableView setEditing:NO animated:NO];
            break;
    }
}

@end
