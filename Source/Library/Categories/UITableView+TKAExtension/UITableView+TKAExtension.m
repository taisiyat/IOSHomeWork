//
//  UITableView+TKAExtension.m
//  IOSHomeWork
//
//  Created by Taisiya on 26.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//


#import "UITableView+TKAExtension.h"
#import "UINib+TKAExtension.h"

@implementation UITableView (TKAExtension)

- (id)dequeueCellWithClass:(Class)cellClass {
    NSString *cellClassString = NSStringFromClass(cellClass);
    
    id cell = [self dequeueReusableCellWithIdentifier:cellClassString];
    if (!cell) {
        cell = [UINib objectWithClass:cellClass];
    }
    
    return cell;
}

//- (void)arrayModelDidChange {
//    switch (self.users.state) {
//        case TKAArrayModelAddChange:
//            [self.tableView.usersTableView setEditing:YES animated:YES];
//            break;
//        case TKAArrayModelRemoveChange:
//            [self.tableView.usersTableView setEditing:YES animated:YES];
//            break;
//        default:
//            [self.tableView.usersTableView setEditing:NO animated:NO];
//            break;
//    }
//}

@end
