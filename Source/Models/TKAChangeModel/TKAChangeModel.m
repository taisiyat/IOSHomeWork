//
//  TKAChangeModel.m
//  IOSHomeWork
//
//  Created by Taisiya on 29.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAChangeModel.h"

@implementation TKAChangeModel

+ (instancetype)modelWithState:(TKAArrayModelState)state {
    TKAChangeModel *result = [self new];
    result.state = state;
    
    return result;
}

+ (instancetype)insertModel:(TKAChangeModelOneIndex *)model
                  withIndex:(NSUInteger)index
{
    return [TKAChangeModelOneIndex modelWithIndex:index
                                        withState:TKAArrayModelAddChange];
}

+ (instancetype)insertModel:(TKAChangeModelOneIndex *)model
              withIndexPath:(NSIndexPath *)indexPath
{
    return [self insertModel:model withIndex:indexPath.row];
}

+ (instancetype)deleteModel:(TKAChangeModelOneIndex *)model
                  withIndex:(NSUInteger)index
{
    return [TKAChangeModelOneIndex modelWithIndex:index
                                        withState:TKAArrayModelRemoveChange];
}

+ (instancetype)deleteModel:(TKAChangeModelOneIndex *)model
              withIndexPath:(NSIndexPath *)indexPath
{
    return [self deleteModel:model withIndex:indexPath.row];
}

+ (instancetype)moveModel:(TKAChangeModelTwoIndex *)model
        withLocationIndex:(NSUInteger)locationIndex
          withTargetIndex:(NSUInteger)targetIndex
{
    return [TKAChangeModelTwoIndex modelWithLocationIndex:(NSUInteger)locationIndex
                                          withTargetIndex:(NSUInteger)targetIndex
                                                withState:TKAArrayModelMoveChange];
}

+ (instancetype)moveModel:(TKAChangeModelTwoIndex *)model
    withLocationIndexPath:(NSIndexPath *)locationIndexPath
      withTargetIndexPath:(NSIndexPath *)targetIndexPath
{
    return [self moveModel:model
         withLocationIndex:locationIndexPath.row
           withTargetIndex:targetIndexPath.row];
}


@end
