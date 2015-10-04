//
//  TKAChangeModel.m
//  IOSHomeWork
//
//  Created by Taisiya on 29.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAChangeModel.h"
#import "TKAChangeModelOneIndex.h"
#import "TKAChangeModelTwoIndex.h"

@interface TKAChangeModel ()
//@property (nonatomic, assign) TKAChangeModelState state;


@end

@implementation TKAChangeModel

//@dynamic state;

+ (instancetype)modelWithState:(TKAChangeModelState)state {
    TKAChangeModel *result = [self new];
    result.state = state;
    
    return result;
}

+ (TKAChangeModelOneIndex *)insertModelWithIndex:(NSUInteger)index {
    return [TKAChangeModelOneIndex modelWithIndex:index
                                        withState:TKAChangeModelAdd];
}

+ (TKAChangeModelOneIndex *)insertModelWithIndexPath:(NSIndexPath *)indexPath {
    return [TKAChangeModelOneIndex modelWithIndexPath:indexPath
                                            withState:TKAChangeModelAdd];
}

+ (TKAChangeModelOneIndex *)deleteModelWithIndex:(NSUInteger)index {
    return [TKAChangeModelOneIndex modelWithIndex:index
                                        withState:TKAChangeModelRemove];
}

+ (TKAChangeModelOneIndex *)deleteModelWithIndexPath:(NSIndexPath *)indexPath {
    return [TKAChangeModelOneIndex modelWithIndexPath:indexPath
                                            withState:TKAChangeModelRemove];
}

+ (TKAChangeModelTwoIndex *)moveModel:(TKAChangeModelTwoIndex *)model
                    withLocationIndex:(NSUInteger)locationIndex
                      withTargetIndex:(NSUInteger)targetIndex
{
    return [TKAChangeModelTwoIndex modelWithLocationIndex:locationIndex
                                          withTargetIndex:targetIndex
                                                withState:TKAChangeModelMove];
}

+ (TKAChangeModelTwoIndex *)moveModel:(TKAChangeModelTwoIndex *)model
                withLocationIndexPath:(NSIndexPath *)locationIndexPath
                  withTargetIndexPath:(NSIndexPath *)targetIndexPath
{
    return [TKAChangeModelTwoIndex modelWithLocationIndexPath:locationIndexPath
                                          withTargetIndexPath:targetIndexPath withState:TKAChangeModelMove];
}

@end
