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
@property (nonatomic, assign) NSUInteger locationIndex;
@property (nonatomic, assign) NSUInteger targetIndex;
@property (nonatomic, assign) NSIndexPath *locationIndexPath;
@property (nonatomic, assign) NSIndexPath *targetIndexPath;

//@end

//@interface TKAChangeModelTwoIndex (TKAIndex)

+ (instancetype)modelWithLocationIndex:(NSUInteger)locationIndex
                       withTargetIndex:(NSUInteger)targetIndex
                             withState:(TKAChangeModelState)state;
//@end

//@interface TKAChangeModelTwoIndex (TKAIndexPath)
//@property (nonatomic, readonly) NSIndexPath *locationIndexPath;
//@property (nonatomic, readonly) NSIndexPath *targetIndexPath;

+ (instancetype)modelWithLocationIndexPath:(NSIndexPath *)locationIndexPath
                       withTargetIndexPath:(NSIndexPath *)targetIndexPath
                                 withState:(TKAChangeModelState)state;
@end
