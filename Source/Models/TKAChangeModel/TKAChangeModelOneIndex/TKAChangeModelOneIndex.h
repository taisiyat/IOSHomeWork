//
//  TKAChangeModelOneIndex.h
//  IOSHomeWork
//
//  Created by Taisiya on 30.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAChangeModel.h"

@interface TKAChangeModelOneIndex : TKAChangeModel
@property (nonatomic, readonly) NSUInteger index;

@end

@interface TKAChangeModelOneIndex (TKAIndex)

+ (instancetype)modelWithIndex:(NSUInteger)index
                     withState:(TKAChangeModelState)state;

@end

@interface TKAChangeModelOneIndex (TKAIndexPath)
@property (nonatomic, readonly) NSIndexPath *indexPath;

+ (instancetype)modelWithIndexPath:(NSIndexPath *)indexPath
                         withState:(TKAChangeModelState)state;

@end
