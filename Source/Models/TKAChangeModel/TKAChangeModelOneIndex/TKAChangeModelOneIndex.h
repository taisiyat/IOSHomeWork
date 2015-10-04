//
//  TKAChangeModelOneIndex.h
//  IOSHomeWork
//
//  Created by Taisiya on 30.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAChangeModel.h"

@interface TKAChangeModelOneIndex : TKAChangeModel
@property (nonatomic, assign) NSUInteger index;

+ (instancetype)modelWithIndex:(NSUInteger)index
                    withState:(TKAChangeModelState)state;

+ (instancetype)modelWithIndexPath:(NSIndexPath *)indexPath
                         withState:(TKAChangeModelState)state;

@end
