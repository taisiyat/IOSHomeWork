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

@end

@implementation TKAChangeModel (TKAIndex)

+ (TKAChangeModelOneIndex *)insertModelWithIndex:(NSUInteger)index {
    return [TKAChangeModelOneIndex modelWithIndex:index
                                        withState:TKAChangeModelAdd];
}

+ (TKAChangeModelOneIndex *)deleteModelWithIndex:(NSUInteger)index {
    return [TKAChangeModelOneIndex modelWithIndex:index
                                        withState:TKAChangeModelRemove];
}

+ (TKAChangeModelTwoIndex *)moveModelwithLocationIndex:(NSUInteger)locationIndex
                                       withTargetIndex:(NSUInteger)targetIndex
{
    return [TKAChangeModelTwoIndex modelWithLocationIndex:locationIndex
                                          withTargetIndex:targetIndex
                                                withState:TKAChangeModelMove];
}

@end

@implementation TKAChangeModel (TKAIndexPath)

+ (TKAChangeModelOneIndex *)insertModelWithIndexPath:(NSIndexPath *)indexPath {
    return [TKAChangeModelOneIndex modelWithIndexPath:indexPath
                                            withState:TKAChangeModelAdd];
}

+ (TKAChangeModelOneIndex *)deleteModelWithIndexPath:(NSIndexPath *)indexPath {
    return [TKAChangeModelOneIndex modelWithIndexPath:indexPath
                                            withState:TKAChangeModelRemove];
}

+ (TKAChangeModelTwoIndex *)moveModelWithLocationIndexPath:(NSIndexPath *)locationIndexPath
                                       withTargetIndexPath:(NSIndexPath *)targetIndexPath
{
    return [TKAChangeModelTwoIndex modelWithLocationIndexPath:locationIndexPath
                                          withTargetIndexPath:targetIndexPath withState:TKAChangeModelMove];
}

@end
