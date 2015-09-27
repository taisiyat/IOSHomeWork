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

TKAViewControllerBaseViewProperty(TKATableViewController, tableView, TKATableView)

@implementation TKATableViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.users addObserver:self];
    [self.tableView.usersTableView reloadData];
}

- (void)viewDidDisappear:(BOOL)animated {
    [self.users removeObserver:self];
}

- (void)viewDidLayoutSubviews {
    
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
        [tableView deleteRowsAtIndexPaths:@[indexPath]
                         withRowAnimation:UITableViewRowAnimationAutomatic];
        self.users.state = TKAUsersArrayNotChange;
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
    
    NSUInteger indexRow = [users countOfUsers] - 1;
    [usersTable insertRowsAtIndexPaths:@[[usersTable indexPathForRow:indexRow]]
                      withRowAnimation:UITableViewRowAnimationAutomatic];
    users.state = TKAUsersArrayNotChange;
}

- (IBAction)onEditButton:(id)sender {
    UITableView *usersTable = self.tableView.usersTableView;
    usersTable.editing = !usersTable.editing;
}

#pragma mark -
#pragma mark TKAUsersArrayObserver

- (void)usersArrayDidChange {
    [self.tableView.usersTableView setEditing:YES animated:YES];
}

- (void)usersArrayDidNotChange {
    [self.tableView.usersTableView setEditing:NO animated:NO];
}

@end
