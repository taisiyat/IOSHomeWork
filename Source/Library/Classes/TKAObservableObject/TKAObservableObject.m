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
@property (nonatomic, assign)     BOOL                 shouldNotify;

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
        self.shouldNotify = YES;
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
            
            if (self.shouldNotify) {
                TKAPerformBlockSyncOnMainQueue(blockNotify);
            }
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
            
            if (self.shouldNotify) {
                TKAPerformBlockSyncOnMainQueue(blockNotify);
            }
        }
    }
}

//- (void)setState:(NSUInteger)state {
//    @synchronized (self) {
//        if (state != _state) {
//            _state = state;
//            
//            void(^blockNotify)() = ^(){
//                [self notifyOfStateChangeWithSelector];
//            };
//            
//            TKAPerformBlockSyncOnMainQueue(blockNotify);
//        }
//    }
//}
//
//- (void)setState:(NSUInteger)state withObject:(id)object {
//    @synchronized (self) {
//        if (state != _state) {
//            _state = state;
//            
//            void(^blockNotify)() = ^(){
//                    [self notifyOfStateChangeWithSelectorWithObject:object];
//            };
//            
//            TKAPerformBlockSyncOnMainQueue(blockNotify);
//        }
//    }
//}


- (NSUInteger)state {
    @synchronized (self) {
        return _state;
    }
}

#pragma mark -
#pragma mark Public

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

- (void)performBlock:(TKABlock)block shouldNotify:(BOOL)shouldNotify {
    BOOL notifyState = self.shouldNotify;
    self.shouldNotify = shouldNotify;
    
    if (block) {
        block();
    }
    
    self.shouldNotify = notifyState;
}

- (void)notifyOfStateWithSelector:(SEL)selector {
    [self notifyOfStateWithSelector:selector withObject:nil];
}

- (void)notifyOfStateWithSelector:(SEL)selector withObject:(id)object {
    NSMutableSet *observerSet = self.mutableObserverSet;
    for (id observer in observerSet) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:self withObject:object];
        }
    }
}

#pragma mark -
#pragma mark Private

- (SEL)selectorForState:(NSUInteger)state {
    return NULL;
}

- (void)notifyOfStateChangeWithSelector {
    [self notifyOfStateChangeWithSelectorWithObject:nil];
}

- (void)notifyOfStateChangeWithSelectorWithObject:(id)object {
    [self notifyOfStateWithSelector:[self selectorForState:_state] withObject:object];
}

@end

