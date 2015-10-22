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
    TKAModelUnLoad,
    TKAModelWillLoad,
    TKAModelDidLoad,
    TKAModelFailLoad,
    TKAModelDidFailLoading,
    TKAModelDidChange
};

@protocol TKAModelObserver <NSObject>

@optional
- (void)modelWillLoad:(id)model;
- (void)modelDidLoad:(id)model;
- (void)modelFailLoad:(id)model;
- (void)modelDidFailLoad:(id)model;
- (void)model:(id)model didChangeWithObject:(TKAChangeModel *)object;

@end

@interface TKAModel : TKAObservableObject <TKAModelObserver>

- (void)load;
- (void)performLoading;
- (void)setupLoading;
- (void)finishLoading;

@end
