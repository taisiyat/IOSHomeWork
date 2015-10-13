//
//  TKAChangeModel+UITableView.m
//  IOSHomeWork
//
//  Created by Taisiya on 06.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAChangeModel+UITableView.h"

#import "TKAChangeModelOneIndex.h"
#import "TKAChangeModelTwoIndex.h"

@implementation TKAChangeModel (UITableView)

- (void)applyToTableView:(UITableView *)tableView {
    [self applyToTableView:tableView rowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)applyToTableView:(UITableView *)tableView rowAnimation:(UITableViewRowAnimation)animation {
    
}

@end

@implementation TKAChangeModelOneIndex (UITableView)

- (void)applyToTableView:(UITableView *)tableView rowAnimation:(UITableViewRowAnimation)animation {
    switch (self.state) {
        case TKAChangeModelAdd:
            [tableView insertRowsAtIndexPaths:@[self.indexPath]
                             withRowAnimation:animation];
            break;
            
        case TKAChangeModelRemove:
            [tableView deleteRowsAtIndexPaths:@[self.indexPath]
                             withRowAnimation:animation];
            break;
            
        default:
            break;
    }
}

@end

@implementation TKAChangeModelTwoIndex (UITableView)

- (void)applyToTableView:(UITableView *)tableView rowAnimation:(UITableViewRowAnimation)animation {
    [tableView moveRowAtIndexPath:self.locationIndexPath
                      toIndexPath:self.targetIndexPath];
}

@end