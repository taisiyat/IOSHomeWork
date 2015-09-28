//
//  NSIndexPath+TKAExtension.m
//  IOSHomeWork
//
//  Created by Taisiya on 28.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "NSIndexPath+TKAExtension.h"

@implementation NSIndexPath (TKAExtension)

+ (NSIndexPath *)indexPathForRow:(NSUInteger)index {
    return [NSIndexPath indexPathWithIndex:index];
}
    
@end
