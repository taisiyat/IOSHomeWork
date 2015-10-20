//
//  TKAObservableObject.h
//  TKAAutoreleasePool
//
//  Created by Taisiya on 04.05.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TKAPerformBlock.h"

@interface TKAObservableObject : NSObject
@property (nonatomic, readonly)  NSSet       *observerSet;
@property (atomic, assign)       NSUInteger  state;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;

- (void)setState:(NSUInteger)state withObject:(id)object;
- (SEL)selectorForState:(NSUInteger)state;

- (void)performBlock:(TKABlock)block shouldNotify:(BOOL)shouldNotify;

// these methods are called in subclasses
- (void)notifyOfStateWithSelector:(SEL)selector;
- (void)notifyOfStateWithSelector:(SEL)selector withObject:(id)object;
@end
