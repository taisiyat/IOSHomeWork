//
//  UITableView+TKAExtension.m
//  IOSHomeWork
//
//  Created by Taisiya on 26.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableView+TKAExtension.h"
#import "UINib+TKAExtension.h"
#import "TKAChangeModel.h"

@implementation UITableView (TKAExtension)

- (id)dequeueCellWithClass:(Class)cellClass {
    NSString *cellClassString = NSStringFromClass(cellClass);
    
    id cell = [self dequeueReusableCellWithIdentifier:cellClassString];
    if (!cell) {
        cell = [UINib objectWithClass:cellClass];
    }
    
    return cell;
}
- (void)updateWithChanges:(TKAChangeModel *)user {
    switch (user.state) {
        case TKAChangeModelAdd:
            [self insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:user.index]] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case TKAChangeModelRemove:
            [self deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:user.index]] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        default:
            break;
    }
}

@end
