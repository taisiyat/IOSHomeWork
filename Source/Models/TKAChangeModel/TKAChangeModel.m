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

+ (instancetype)modelWithIndex:(NSUInteger)index withState:(TKAChangeModelState)state {
    TKAChangeModel *result = [self new];
    result.state = state;
    result.index = index;
    
    return result;
}

+ (instancetype)insertModelWithIndex:(NSUInteger)index {
        return [TKAChangeModel modelWithIndex:index
                                            withState:TKAChangeModelAdd];
    }


    + (instancetype)deleteModelWithIndex:(NSUInteger)index {
        return [TKAChangeModel modelWithIndex:index
                                            withState:TKAChangeModelRemove];
    }

//+ (instancetype)insertModelWithIndex:(NSUInteger)index {
//    return [TKAChangeModelOneIndex modelWithIndex:index
//                                        withState:TKAChangeModelAdd];
//}
//
//+ (instancetype)insertModelWithIndexPath:(NSIndexPath *)indexPath {
//    return [self insertModelWithIndex:indexPath.row];
//}
//
//+ (instancetype)deleteModelWithIndex:(NSUInteger)index {
//    return [TKAChangeModelOneIndex modelWithIndex:index
//                                        withState:TKAChangeModelRemove];
//}
//
//+ (instancetype)deleteModelWithIndexPath:(NSIndexPath *)indexPath {
//    return [self deleteModelWithIndex:indexPath.row];
//}
//
//- (NSUInteger)index {
//    return self.index;
//}

//+ (instancetype)moveModel:(TKAChangeModelTwoIndex *)model
//        withLocationIndex:(NSUInteger)locationIndex
//          withTargetIndex:(NSUInteger)targetIndex
//{
//    return [TKAChangeModelTwoIndex modelWithLocationIndex:(NSUInteger)locationIndex
//                                          withTargetIndex:(NSUInteger)targetIndex
//                                                withState:TKAChangeModelMove];
//}
//
//+ (instancetype)moveModel:(TKAChangeModelTwoIndex *)model
//    withLocationIndexPath:(NSIndexPath *)locationIndexPath
//      withTargetIndexPath:(NSIndexPath *)targetIndexPath
//{
//    return [self moveModel:model
//         withLocationIndex:locationIndexPath.row
//           withTargetIndex:targetIndexPath.row];
//}


@end
