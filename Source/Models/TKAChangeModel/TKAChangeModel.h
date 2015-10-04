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
    TKAChangeModelRemove
};

@interface TKAChangeModel : NSObject
@property (nonatomic, readonly) TKAChangeModelState state;

+ (instancetype)modelWithState:(TKAChangeModelState)state;

+ (TKAChangeModelOneIndex *)insertModelWithIndex:(NSUInteger)index;

+ (TKAChangeModelOneIndex *)insertModelWithIndexPath:(NSIndexPath *)indexPath;

+ (instancetype)deleteModelWithIndex:(NSUInteger)index;

+ (instancetype)deleteModelWithIndexPath:(NSIndexPath *)indexPath;

+ (instancetype)moveModelWithLocationIndex:(NSUInteger)locationIndex
                           withTargetIndex:(NSUInteger)targetIndex;

+ (instancetype)moveModelWithLocationIndexPath:(NSIndexPath *)locationIndexPath
                           withTargetIndexPath:(NSIndexPath *)targetIndexPath;


@end
