//
//  NSMutableArray+TKAExtension.m
//  IOSHomeWork
//
//  Created by Taisiya on 06.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "NSMutableArray+TKAExtension.h"

@implementation NSMutableArray (TKAExtension)

- (void)moveObjectFromLocationIndex:(NSUInteger)locationIndex
                      toTargetIndex:(NSUInteger)targetIndex {
    
    id object = [self objectAtIndex:locationIndex];
    
    [self removeObjectAtIndex:locationIndex];
    [self insertObject:object atIndex:targetIndex];
}

@end
