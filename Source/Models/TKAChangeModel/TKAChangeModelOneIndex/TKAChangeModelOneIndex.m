//
//  TKAChangeModelOneIndex.m
//  IOSHomeWork
//
//  Created by Taisiya on 30.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAChangeModelOneIndex.h"

//@interface TKAChangeModelOneIndex ()//(TKAIndex)
//@property (nonatomic, assign) NSUInteger index;
//
//@end

@implementation TKAChangeModelOneIndex //(TKAIndex)

//@dynamic index;

+ (instancetype)modelWithIndex:(NSUInteger)index
                    withState:(TKAChangeModelState)state {
    TKAChangeModelOneIndex *result = [self modelWithState:state];
    result.index = index;

    return result;
}

//@end
//
//@implementation TKAChangeModelOneIndex (TKAIndexPath)

#pragma mark -
#pragma mark Acessors Methods

- (NSIndexPath *)indexPath {
    return [NSIndexPath indexPathForRow:self.index];
}

+ (instancetype)modelWithIndexPath:(NSIndexPath *)indexPath
                         withState:(TKAChangeModelState)state
{
    return [self modelWithIndex:indexPath.row withState:state];
}

@end
