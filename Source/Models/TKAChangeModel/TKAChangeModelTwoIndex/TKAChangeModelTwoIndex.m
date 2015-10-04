//
//  TKAChangeModelTwoIndex.m
//  IOSHomeWork
//
//  Created by Taisiya on 30.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAChangeModelTwoIndex.h"

@interface TKAChangeModelTwoIndex ()
//@property (nonatomic, assign) NSUInteger locationIndex;
//@property (nonatomic, assign) NSUInteger targetIndex;

@end

@implementation TKAChangeModelTwoIndex

//@dynamic locationIndex;
//@dynamic targetIndex;

+ (instancetype)modelWithLocationIndex:(NSUInteger)locationIndex
                       withTargetIndex:(NSUInteger)targetIndex
                             withState:(TKAChangeModelState)state
{
    TKAChangeModelTwoIndex *result = [self modelWithState:state];
    result.locationIndex = locationIndex;
    result.targetIndex = targetIndex;
    
    return result;
}

+ (instancetype)modelWithLocationIndexPath:(NSIndexPath *)locationIndexPath
                       withTargetIndexPath:(NSIndexPath *)targetIndexPath
                             withState:(TKAChangeModelState)state
{
    TKAChangeModelTwoIndex *result = [self modelWithState:state];
    result.locationIndexPath = locationIndexPath;
    result.targetIndexPath = targetIndexPath;
    
    return result;
}

@end
