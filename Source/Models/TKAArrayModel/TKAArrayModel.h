//
//  TKAArrayModel.h
//  IOSHomeWork
//
//  Created by Taisiya on 26.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TKAModel.h"

@class TKAChangeModel;

@interface TKAArrayModel : TKAModel
@property (nonatomic, readonly) NSArray     *units;
@property (nonatomic, readonly) NSUInteger  count;

@property (nonatomic, copy) NSString *fileFolder;
@property (nonatomic, copy) NSString *filePath;

+ (instancetype)arrayModel;

- (void)addUnit:(id)unit;
- (void)addUnit:(id)unit atIndex:(NSUInteger)index;
- (void)removeUnit:(id)unit;
- (void)removeUnitAtIndex:(NSUInteger)index;
- (id)unitAtIndex:(NSUInteger)index;
- (NSUInteger)indexOfObject:(id)unit;
- (NSIndexPath *)indexPathOfObject:(id)unit;
- (id)objectAtIndexedSubscript:(NSUInteger)index;
- (void)moveUnitAtIndex:(NSUInteger)sourceIndex
                toIndex:(NSUInteger)destinationIndex;

@end
