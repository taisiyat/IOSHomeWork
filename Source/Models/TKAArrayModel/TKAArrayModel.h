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
//@class TKAArrayModel;
//
//typedef NS_ENUM(NSUInteger, TKAArrayModelState) {
//    TKAArrayModelNotChange,
//    TKAArrayModelChange,
//    TKAArrayModelWillLoad,
//    TKAArrayModelDidLoad,
//    TKAArrayModelFailLoad
//};
//
//@protocol TKAArrayModelObsserver <NSObject>
//
//@optional
//- (void)arrayModel:(TKAArrayModel *)arrayModel didChangeWithObject:(TKAChangeModel *)object;
//
//@end

@interface TKAArrayModel : TKAModel//TKAObservableObject <TKAArrayModelObsserver, NSCoding>
@property (nonatomic, readonly) NSArray     *units;
@property (nonatomic, readonly) NSUInteger  count;

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

//- (void)load;
- (void)save;
//- (void)performLoading;

@end
