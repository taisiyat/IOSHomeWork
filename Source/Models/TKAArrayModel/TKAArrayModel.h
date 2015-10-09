//
//  TKAArrayModel.h
//  IOSHomeWork
//
//  Created by Taisiya on 26.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TKAObservableObject.h"

@class TKAChangeModel;
@class TKAArrayModel;

typedef NS_ENUM(NSUInteger, TKAArrayModelState) {
    TKAArrayModelNotChange,
    TKAArrayModelChange,
    TKAArrayModelWillLoad,
    TKAArrayModelDidLoad,
    TKAArrayModelFailLoad
};

@protocol TKAArrayModelObsserver <NSObject>

@optional
- (void)arrayModel:(TKAArrayModel *)arrayModel didChangeWithObject:(TKAChangeModel *)object;
- (void)arrayModelWillLoad;
- (void)arrayModelDidLoad;
- (void)arrayModelFailLoad;

@end

@interface TKAArrayModel : TKAObservableObject <TKAArrayModelObsserver>
@property (nonatomic, readonly) NSArray     *units;
@property (nonatomic, readonly) NSUInteger  count;

@property (nonatomic, copy) NSString  *filePath;
//@property (nonatomic, readonly) NSFileManager  *filePath;

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

- (void)loadArrayModel;
- (void)saveArrayModel;

@end
