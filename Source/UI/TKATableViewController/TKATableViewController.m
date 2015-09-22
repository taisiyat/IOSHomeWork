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

//@interface TKATableViewController ()
//
//@end

TKAViewControllerBaseViewProperty(TKATableViewController, tableView, TKATableView)

@implementation TKATableViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
//    return 100;
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
    
//    cell.user = [TKAUser new];
    cell.user = [self.users userAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onAddButton:(id)sender {
    TKAUsers *users = self.users;
    UITableView *usersTable = self.tableView.usersTableView;
    [users addUser:[TKAUser new]];
    
    [usersTable beginUpdates];
    [usersTable insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:([users countOfUsers] - 1) inSection:0]]
                      withRowAnimation:UITableViewRowAnimationNone];
    [usersTable endUpdates];
}

- (IBAction)onRemoveButton:(id)sender {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
