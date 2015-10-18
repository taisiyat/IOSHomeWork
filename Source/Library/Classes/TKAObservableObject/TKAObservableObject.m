//
//  TKAObservableObject.m
//  TKAAutoreleasePool
//
//  Created by Taisiya on 04.05.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAObservableObject.h"
#import "TKAAssignReference.h"
#import "TKAPerformBlock.h"
//#import "TKACarBathTest.h"

@interface TKAObservableObject ()
@property (nonatomic, retain)     NSMutableSet       *mutableObserverSet;

@end

@implementation TKAObservableObject

@synthesize state = _state;
@dynamic observerSet;

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.mutableObserverSet = nil;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObserverSet = [NSMutableSet set];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accesssors

- (NSSet *)observerSet {
    return [self.mutableObserverSet copy];
}

- (void)setState:(NSUInteger)state {
    @synchronized (self) {
        if (state != _state) {
            _state = state;
            
            void(^blockNotify)() = ^(){
                [self notifyOfStateChangeWithSelector];
            };
            
            TKAPerformBlockSyncOnMainQueue(blockNotify);
        }
    }
}

- (void)setState:(NSUInteger)state withObject:(id)object {
    @synchronized (self) {
        if (state != _state) {
            _state = state;
            
            void(^blockNotify)() = ^(){
                [self notifyOfStateChangeWithSelectorWithObject:object];
            };
            
            TKAPerformBlockSyncOnMainQueue(blockNotify);
        }
    }
}

- (NSUInteger)state {
    @synchronized (self) {
        return _state;
    }
}

#pragma mark -
#pragma mark Pablic

- (void)addObserver:(id)observer {
    @synchronized (self) {
        [self.mutableObserverSet addObject:observer];
    }
}

- (void)removeObserver:(id)observer {
    @synchronized (self) {
        [self.mutableObserverSet removeObject:observer];
    }
}

#pragma mark -
#pragma mark Private

- (SEL)selectorForState:(NSUInteger)state {
    return NULL;
}

- (void)notifyOfStateChangeWithSelector {
    NSMutableSet *observerSet = self.mutableObserverSet;
    SEL selector = [self selectorForState:_state];
    for (id observer in observerSet) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:self];
        }
    }
}

- (void)notifyOfStateChangeWithSelectorWithObject:(id)object {
    NSMutableSet *observerSet = self.mutableObserverSet;
    SEL selector = [self selectorForState:_state];
    for (id observer in observerSet) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:self withObject:object];
        }
    }
}

@end


