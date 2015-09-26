//
//  UITableView+TKAExtension.m
//  IOSHomeWork
//
//  Created by Taisiya on 26.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "UITableView+TKAExtension.h"

@implementation UITableView (TKAExtension)

- (NSIndexPath *)indexPathForRow:(NSInteger)indexRow {
    return [NSIndexPath indexPathForRow:indexRow inSection:0];
}

@end
