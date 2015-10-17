//
//  TKAModel.h
//  IOSHomeWork
//
//  Created by Taisiya on 17.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAObservableObject.h"

@class TKAChangeModel;

typedef NS_ENUM(NSUInteger, TKAModelState) {
    TKAModelNotChange,
    TKAModelChange,
    TKAModelWillLoad,
    TKAModelDidLoad,
    TKAModelFailLoad,
    TKAModelDidFailLoad
};

@protocol TKAChangeModelObserver <NSObject>

@optional
- (void)model:(id)model didChangeWithObject:(TKAChangeModel *)object;

@end

@protocol TKALoadingModelObserver <NSObject>

@optional
- (void)modelWillLoad:(id)model;
- (void)modelDidLoad:(id)model;
- (void)modelFailLoad:(id)model;
- (void)modelDidFailLoad:(id)model;

@end

@interface TKAModel : TKAObservableObject <TKAChangeModelObserver, TKALoadingModelObserver>

- (void)load;
- (void)performLoading;

@end
