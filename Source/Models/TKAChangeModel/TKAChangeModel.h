//
//  TKAChangeModel.h
//  IOSHomeWork
//
//  Created by Taisiya on 29.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TKAArrayModel.h"
#import "TKAChangeModelOneIndex.h"
#import "TKAChangeModelTwoIndex.h"

#import "NSIndexPath+TKAExtension.h"

@interface TKAChangeModel : TKAArrayModel
@property (nonatomic, readonly) TKAArrayModelState state;

+ (instancetype)modelWithState:(TKAArrayModelState)state;

+ (instancetype)insertModel:(TKAChangeModelOneIndex *)model
                  withIndex:(NSUInteger)index;

+ (instancetype)insertModel:(TKAChangeModelOneIndex *)model
              withIndexPath:(NSIndexPath *)indexPath;

+ (instancetype)deleteModel:(TKAChangeModelOneIndex *)model
                  withIndex:(NSUInteger)index;

+ (instancetype)deleteModel:(TKAChangeModelOneIndex *)model
              withIndexPath:(NSIndexPath *)indexPath;

+ (instancetype)moveModel:(TKAChangeModelTwoIndex *)model
        withLocationIndex:(NSUInteger)locationIndex
          withTargetIndex:(NSUInteger)targetIndex;

+ (instancetype)moveModel:(TKAChangeModelTwoIndex *)model
    withLocationIndexPath:(NSIndexPath *)locationIndexPath
      withTargetIndexPath:(NSIndexPath *)targetIndexPath;


@end
