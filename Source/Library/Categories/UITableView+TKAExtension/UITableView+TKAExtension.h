//
//  UITableView+TKAExtension.h
//  IOSHomeWork
//
//  Created by Taisiya on 26.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (TKAExtension)

- (NSIndexPath *)indexPathForRow:(NSInteger)indexRow;

- (id)cellWithClass:(Class)cellClass;
- (id)cellIfNotReusableCell:(id)cell withClass:(Class)cellClass;

@end
