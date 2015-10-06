//
//  UITableView+TKAExtension.h
//  IOSHomeWork
//
//  Created by Taisiya on 26.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class TKAChangeModel;

@interface UITableView (TKAExtension)

- (id)dequeueCellWithClass:(Class)cellClass;
- (void)updateWithChanges:(TKAChangeModel *)model;
- (void)updateWithChanges:(TKAChangeModel *)model withRowAnimation:(UITableViewRowAnimation)animation;

@end
