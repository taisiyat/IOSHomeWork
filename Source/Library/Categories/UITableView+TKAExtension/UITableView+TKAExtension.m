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

- (NSIndexPath *)indexPathForRow:(NSInteger)indexRow {
    return [NSIndexPath indexPathForRow:indexRow inSection:0];
}

- (id)cellWithClass:(Class)cellClass {
    NSString *cellClassString = NSStringFromClass(cellClass);
    
    return [self dequeueReusableCellWithIdentifier:cellClassString];
}

- (id)cellIfNotReusableCell:(id)cell withClass:(Class)cellClass {
    if (!cell) {
        NSString *cellClassString = NSStringFromClass(cellClass);
        UINib *nib = [UINib nibWithNibName:cellClassString bundle:nil];
        NSArray *cells = [nib instantiateWithOwner:nil options:nil];
        cell = [cells firstObject];
//        cell = [UINib objectWithClass:cellClass];
    }
    
    return cell;
}

@end
