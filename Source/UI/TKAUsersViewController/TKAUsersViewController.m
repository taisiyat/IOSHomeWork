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
#import "TKABaseView.h"

#import "TKAMacros.h"

#import "UITableView+TKAExtension.h"
#import "NSIndexPath+TKAExtension.h"

static NSString * const kTKANavigationItemTitle  = @"users";
static NSString * const kTKANavigationAddButton  = @"ADD";
static NSString * const kTKANavigationEditButton = @"EDIT";

TKAViewControllerBaseViewProperty(TKAUsersViewController, usersView, TKAUsersView)

@implementation TKAUsersViewController

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.users = nil;
}

- (void)setUsers:(TKAUsers *)users {
    TKASynthesizeObservingSetter(users, users);
//    [users load];
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
    
    [self.users load];
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
    TKAUsers *users = self.users;
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
    usersItem.title = kTKANavigationItemTitle;
    usersItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:kTKANavigationAddButton
                                                                   style:UIBarButtonItemStyleDone
                                                                  target:self
                                                                  action:@selector(onAddButton:)];
    usersItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:kTKANavigationEditButton
                                                                    style:UIBarButtonItemStyleDone
                                                                   target:self
                                                                   action:@selector(onEditButton:)];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onAddButton:(id)sender {
    [self.users addUnit:[TKAUser user]];
}

- (IBAction)onEditButton:(id)sender {
    TKAUsersView *table = self.usersView;
    table.editing = !table.editing;
}

#pragma mark -
#pragma mark TKALoadingModelObserver

- (void)modelWillLoad:(TKAUsers *)users {
    [self.usersView showLoadingView];
}

- (void)modelDidLoad:(TKAArrayModel *)users {
    [self.usersView.tableView reloadData];
    [self.usersView hideLoadingView];
}

- (void)modelUnload:(TKAArrayModel *)users {

}

- (void)modelDidFailLoading:(TKAArrayModel *)users {
    [self.users load];
}

#pragma mark -
#pragma mark TKAChangeModelObserver

- (void)model:(TKAArrayModel *)users didChangeWithObject:(TKAChangeModel *)user {
    UITableView *table = self.usersView.tableView;
    
    switch (self.users.state) {
        case TKAModelDidChange: {
            [table updateWithChanges:user];
        }
            break;
            
        default:
            break;
    }
}

@end

