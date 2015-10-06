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
//@property (nonatomic, readonly) TKAChangeModelState state;
//@property (nonatomic, readonly) NSUInteger index;
//@property (nonatomic, readonly) NSUInteger locationIndex;
//@property (nonatomic, readonly) NSUInteger targetIndex;
@property (nonatomic, assign) TKAChangeModelState state;
@property (nonatomic, assign) NSUInteger index;
@property (nonatomic, assign) NSUInteger locationIndex;
@property (nonatomic, assign) NSUInteger targetIndex;


+ (instancetype)modelWithState:(TKAChangeModelState)state;

//@end
//
//@interface TKAChangeModel (TKAIndex)

+ (TKAChangeModelOneIndex *)insertModelWithIndex:(NSUInteger)index;
+ (TKAChangeModelOneIndex *)deleteModelWithIndex:(NSUInteger)index;
+ (TKAChangeModelTwoIndex *)moveModelWithLocationIndex:(NSUInteger)locationIndex
                                       withTargetIndex:(NSUInteger)targetIndex;

- (NSIndexPath *)indexPath;
//@end
//
//@interface TKAChangeModel (TKAIndexPath)

+ (TKAChangeModelOneIndex *)insertModelWithIndexPath:(NSIndexPath *)indexPath;
+ (TKAChangeModelOneIndex *)deleteModelWithIndexPath:(NSIndexPath *)indexPath;
+ (TKAChangeModelTwoIndex *)moveModelWithLocationIndexPath:(NSIndexPath *)locationIndexPath
                                       withTargetIndexPath:(NSIndexPath *)targetIndexPath;
- (NSIndexPath *)locationIndexPath;
- (NSIndexPath *)targetIndexPath;

@end