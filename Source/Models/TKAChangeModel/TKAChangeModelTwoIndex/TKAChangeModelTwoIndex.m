//
//  TKAChangeModelTwoIndex.m
//  IOSHomeWork
//
//  Created by Taisiya on 30.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAChangeModelTwoIndex.h"

@interface TKAChangeModelTwoIndex ()
@property (nonatomic, assign) NSUInteger modelLocationIndex;
@property (nonatomic, assign) NSUInteger modelTargetIndex;

@end

@implementation TKAChangeModelTwoIndex

@dynamic locationIndex;
@dynamic targetIndex;

@end

@implementation TKAChangeModelTwoIndex (TKAIndex)

+ (instancetype)modelWithLocationIndex:(NSUInteger)locationIndex
                       withTargetIndex:(NSUInteger)targetIndex
                             withState:(TKAChangeModelState)state
{
    TKAChangeModelTwoIndex *result = [self modelWithState:state];
    result.modelLocationIndex = locationIndex;
    result.modelTargetIndex = targetIndex;
    
    return result;
}

#pragma mark -
#pragma mark Acessors Methods

- (NSUInteger)locationIndex {
    return self.modelLocationIndex;
}

- (NSUInteger)targetIndex {
    return self.modelTargetIndex;
}

@end

@implementation TKAChangeModelTwoIndex (TKAIndexPath)

+ (instancetype)modelWithLocationIndexPath:(NSIndexPath *)locationIndexPath
                       withTargetIndexPath:(NSIndexPath *)targetIndexPath
                                 withState:(TKAChangeModelState)state
{
    return [self modelWithLocationIndex:locationIndexPath.row withTargetIndex:targetIndexPath.row withState:state];
}

#pragma mark -
#pragma mark Acessors Methods

- (NSIndexPath *)locationIndexPath {
    return [NSIndexPath indexPathForRow:self.modelLocationIndex];
}

- (NSIndexPath *)targetIndexPath {
    return [NSIndexPath indexPathForRow:self.modelTargetIndex];
}

@end
