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

+(instancetype)modelWithIndex:(NSUInteger)index
                    withState:(TKAArrayModelState *)state;

+ (instancetype)modelWithIndexPath:(NSIndexPath *)indexPath
                         withState:(TKAArrayModelState *)state;

@end
