//
//  NSIndexPath+TKAExtension.m
//  IOSHomeWork
//
//  Created by Taisiya on 28.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NSIndexPath+TKAExtension.h"

@implementation NSIndexPath (TKAExtension)

+ (NSIndexPath *)indexPathForRow:(NSUInteger)indexRow {
    return [NSIndexPath indexPathForRow:indexRow inSection:0];
}
    
@end
