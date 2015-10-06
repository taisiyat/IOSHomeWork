//
//  UITableView+TKAExtension.m
//  IOSHomeWork
//
//  Created by Taisiya on 26.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TKAChangeModel.h"

#import "TKAChangeModel+UITableView.h"
#import "UITableView+TKAExtension.h"
#import "UINib+TKAExtension.h"

@implementation UITableView (TKAExtension)

- (id)dequeueCellWithClass:(Class)cellClass {
    id cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(cellClass)];
 
    if (!cell) {
        cell = [UINib objectWithClass:cellClass];
    }
    
    return cell;
}

- (void)updateWithChanges:(TKAChangeModel *)model {
    
//    TKAChangeModelOneIndex *modelOne = model;
//    TKAChangeModelTwoIndex *modelTwo = model;
    
    switch (model.state) {
        case TKAChangeModelAdd:
            [self insertRowsAtIndexPaths:@[[model indexPath]]
                        withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
            
        case TKAChangeModelRemove:
            [self deleteRowsAtIndexPaths:@[[model indexPath]]
                        withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
            
        case TKAChangeModelMove:
            [self moveRowAtIndexPath:[model locationIndexPath]
                         toIndexPath:[model targetIndexPath]];
            break;
 
        default:
            break;
    }
}

//- (void)updateWithChanges:(TKAChangeModel *)model {
//    [self updateWithChanges:model withRowAnimation:UITableViewRowAnimationAutomatic];
//}

- (void)updateWithChanges:(TKAChangeModel *)model withRowAnimation:(UITableViewRowAnimation)animation {
    [self beginUpdates];
    [model useToTableView:self rowAnimation:animation];
    [self endUpdates];
}

@end
