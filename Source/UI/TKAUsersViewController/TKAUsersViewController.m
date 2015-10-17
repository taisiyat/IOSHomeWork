//
//  TKAUsersViewController.m
//  IOSHomeWork
//
//  Created by Taisiya on 04.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAUsersViewController.h"

#import "TKAUsersView.h"
#import "TKAUserCell.h"
#import "TKAUser.h"
#import "TKAUsers.h"

#import "TKAMacros.h"

#import "UITableView+TKAExtension.h"
#import "NSIndexPath+TKAExtension.h"

TKAViewControllerBaseViewProperty(TKAUsersViewController, usersView, TKAUsersView)

@implementation TKAUsersViewController

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.users = nil;
}

- (void)setUsers:(TKAUsers *)users {
    TKASynthesizeObservingSetter(users, users);
}

#pragma mark -
#pragma mark View Lifecycle

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        [self setupNavigationItem];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.usersView.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)   tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section
{
    return [self.users count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TKAUserCell *cell = [tableView dequeueCellWithClass:[TKAUserCell class]];
    
    cell.user = self.users[indexPath.row];
    
    return cell;
}

- (void)     tableView:(UITableView *)tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
     forRowAtIndexPath:(NSIndexPath *)indexPath
{
    TKAArrayModel *users = self.users;
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [users removeUnitAtIndex:indexPath.row];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        [users addUnit:[TKAUser new] atIndex:indexPath.row];
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

- (void)setupNavigationItem {
    UINavigationItem *usersItem = self.navigationItem;
    usersItem.title = @"users";
    usersItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                   initWithTitle:@"ADD"
                                   style:UIBarButtonItemStyleDone
                                   target:self
                                   action:@selector(onAddButton:)];
    usersItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                    initWithTitle:@"Edit"
                                    style:UIBarButtonItemStyleDone
                                    target:self
                                    action:@selector(onEditButton:)];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onAddButton:(id)sender {
    TKAUsers *users = self.users;
    [users addUnit:[TKAUser user]];
}

- (IBAction)onEditButton:(id)sender {
    TKAUsersView *table = self.usersView;
    table.editing = !table.editing;
}

- (IBAction)onSaveButton:(id)sender {
 //   [self.users save];
}

- (IBAction)onLoadButton:(id)sender {
//    [self.users load];
    [self.usersView.tableView reloadData];
}

- (IBAction)onShowButton:(id)sender {
    [self.usersView show];
}

- (IBAction)onHideButton:(id)sender {
    [self.usersView hide];
}

#pragma mark -
#pragma mark TKALoadingModelObserver

- (void)modelWillLoad:(TKAArrayModel *)users {
    
}

- (void)modelDidLoad:(TKAArrayModel *)users {
    
}

- (void)modelFailLoad:(TKAArrayModel *)users {
    
}

- (void)modelDidFailLoad:(TKAArrayModel *)users {
    
}

#pragma mark -
#pragma mark TKAChangeModelObserver

- (void)model:(TKAArrayModel *)users didChangeWithObject:(TKAChangeModel *)user {
    UITableView *table = self.usersView.tableView;
    switch (self.users.state) {
        case TKAModelChange: {
            [table updateWithChanges:user];
            users.state = TKAModelNotChange;
        }
            break;
            
        default:
            break;
    }
}

@end

