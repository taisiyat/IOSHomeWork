//
//  TKAChangeModelOneIndex.m
//  IOSHomeWork
//
//  Created by Taisiya on 30.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAChangeModelOneIndex.h"

@interface TKAChangeModelOneIndex ()
@property (nonatomic, assign) NSUInteger index;

@end

@implementation TKAChangeModelOneIndex

@dynamic index;

+ (instancetype)modelWithIndex:(NSUInteger)index
                    withState:(TKAArrayModelState *)state {
    TKAChangeModelOneIndex *result = [self new];
    result.index = index;
    return result;
}

+ (instancetype)modelWithIndexPath:(NSIndexPath *)indexPath
                         withState:(TKAArrayModelState *)state
{
    return  [self modelWithIndex:indexPath.row withState:state];
}


@end
