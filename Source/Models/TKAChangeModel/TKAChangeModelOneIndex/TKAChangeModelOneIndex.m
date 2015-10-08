//
//  TKAChangeModelOneIndex.m
//  IOSHomeWork
//
//  Created by Taisiya on 30.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAChangeModelOneIndex.h"

@interface TKAChangeModelOneIndex ()
@property (nonatomic, assign) NSUInteger modelIndex;

@end

@implementation TKAChangeModelOneIndex

@dynamic index;

@end

@implementation TKAChangeModelOneIndex (TKAIndex)

+ (instancetype)modelWithIndex:(NSUInteger)index
                    withState:(TKAChangeModelState)state {
    TKAChangeModelOneIndex *result = [self modelWithState:state];
    result.modelIndex = index;

    return result;
}

#pragma mark -
#pragma mark Acessors Methods

- (NSUInteger)index {
    return self.modelIndex;
}

@end

@implementation TKAChangeModelOneIndex (TKAIndexPath)

+ (instancetype)modelWithIndexPath:(NSIndexPath *)indexPath
                         withState:(TKAChangeModelState)state
{
    return [self modelWithIndex:indexPath.row withState:state];
}

#pragma mark -
#pragma mark Acessors Methods

- (NSIndexPath *)indexPath {
    return [NSIndexPath indexPathForRow:self.modelIndex];
}

@end
