//
//  TKAChangeModel.h
//  IOSHomeWork
//
//  Created by Taisiya on 29.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSIndexPath+TKAExtension.h"

@class TKAChangeModelOneIndex;
@class TKAChangeModelTwoIndex;

typedef NS_ENUM(NSUInteger, TKAChangeModelState) {
    TKAChangeModelAdd,
    TKAChangeModelRemove,
    TKAChangeModelMove
};

@interface TKAChangeModel : NSObject
@property (nonatomic, assign) TKAChangeModelState state;
@property (nonatomic, assign) NSUInteger index;
@property (nonatomic, assign) NSIndexPath *indexPath;
@property (nonatomic, assign) NSUInteger locationIndex;
@property (nonatomic, assign) NSUInteger targetIndex;
@property (nonatomic, assign) NSIndexPath *locationIndexPath;
@property (nonatomic, assign) NSIndexPath *targetIndexPath;

+ (instancetype)modelWithState:(TKAChangeModelState)state;

+ (TKAChangeModelOneIndex *)insertModelWithIndex:(NSUInteger)index;

+ (TKAChangeModelOneIndex *)insertModelWithIndexPath:(NSIndexPath *)indexPath;

+ (TKAChangeModelOneIndex *)deleteModelWithIndex:(NSUInteger)index;

+ (TKAChangeModelOneIndex *)deleteModelWithIndexPath:(NSIndexPath *)indexPath;

+ (TKAChangeModelTwoIndex *)moveModelWithLocationIndex:(NSUInteger)locationIndex
                                       withTargetIndex:(NSUInteger)targetIndex;

+ (TKAChangeModelTwoIndex *)moveModelWithLocationIndexPath:(NSIndexPath *)locationIndexPath
                                       withTargetIndexPath:(NSIndexPath *)targetIndexPath;
@end
