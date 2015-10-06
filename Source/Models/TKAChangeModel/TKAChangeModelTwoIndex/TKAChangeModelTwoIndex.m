//
//  TKAChangeModelTwoIndex.m
//  IOSHomeWork
//
//  Created by Taisiya on 30.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAChangeModelTwoIndex.h"

//@interface TKAChangeModelTwoIndex () //(TKAIndex)
//@property (nonatomic, assign) NSUInteger locationIndex;
//@property (nonatomic, assign) NSUInteger targetIndex;
//
//@end

@implementation TKAChangeModelTwoIndex //(TKAIndex)

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

//@end
//
//@implementation TKAChangeModelTwoIndex (TKAIndexPath)

#pragma mark -
#pragma mark Acessors Methods

- (NSIndexPath *)locationIndexPath {
    return [NSIndexPath indexPathForRow:self.locationIndex];
}

- (NSIndexPath *)targetIndexPath {
    return [NSIndexPath indexPathForRow:self.targetIndex];
}

+ (instancetype)modelWithLocationIndexPath:(NSIndexPath *)locationIndexPath
                       withTargetIndexPath:(NSIndexPath *)targetIndexPath
                                 withState:(TKAChangeModelState)state
{
    return [self modelWithLocationIndex:locationIndexPath.row withTargetIndex:targetIndexPath.row withState:state];
}

@end
