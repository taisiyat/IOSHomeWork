//
//  TKAChangeModelTwoIndex.h
//  IOSHomeWork
//
//  Created by Taisiya on 30.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAChangeModel.h"

@interface TKAChangeModelTwoIndex : TKAChangeModel
//@property (nonatomic, readonly) NSUInteger locationIndex;
//@property (nonatomic, readonly) NSUInteger targetIndex;

+ (instancetype)modelWithLocationIndex:(NSUInteger)locationIndex
                       withTargetIndex:(NSUInteger)targetIndex
                             withState:(TKAChangeModelState)state;

+ (instancetype)modelWithLocationIndexPath:(NSIndexPath *)locationIndexPath
                       withTargetIndexPath:(NSIndexPath *)targetIndexPath
                                 withState:(TKAChangeModelState)state;

@end
