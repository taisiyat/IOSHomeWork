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

TKAViewControllerBaseViewProperty(TKATableViewController, tableView, TKATableView)

@implementation TKATableViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView.usersTableView reloadData];
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
    NSString *cellClass = NSStringFromClass([TKATableCell class]);
    
    TKATableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellClass];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:cellClass bundle:nil];
        NSArray *cells = [nib instantiateWithOwner:nil options:nil];
        cell = [cells firstObject];
    }
    
    cell.user = [self.users userAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onAddButton:(id)sender {
    TKAUsers *users = self.users;
    UITableView *usersTable = self.tableView.usersTableView;
    [users addUser:[TKAUser user]];
    
    NSUInteger indexRow = [users countOfUsers] - 1;
    [usersTable insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:indexRow inSection:0]]
                      withRowAnimation:UITableViewRowAnimationAutomatic];
    
//    [usersTable reloadData];
}

- (IBAction)onRemoveButton:(id)sender {
    UITableView *usersTable = self.tableView.usersTableView;
    TKATableView *tableView = self.tableView;
    usersTable.editing = !usersTable.editing;
}

@end
