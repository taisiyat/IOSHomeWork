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

- (void)setState:(NSUInteger)state withObject:(id)object{
    @synchronized (self) {
        if (state != _state) {
            _state = state;
            
            void(^blockNotify)() = ^(){
                [self notifyObserverWithSelector:@selector(arrayModel:didChangeWithObject:)
                            withObservableObject:self
                                      withObject:object];
            };
            
            TKAPerformBlockOnMainQueue(blockNotify);
        }
    }
}

#pragma mark -
#pragma mark Pablic

- (void)addObserver:(id)observer {
        [self.mutableObserverSet addObject:observer];
}

- (void)removeObserver:(id)observer {
        [self.mutableObserverSet removeObject:observer];
}

#pragma mark -
#pragma mark Private

- (void)notifyOfStateChangeWithSelector:(SEL)selector {
    NSMutableSet *observerSet = self.mutableObserverSet;
        for (id observer in observerSet) {
            if ([observer respondsToSelector:selector]) {
                [observer performSelector:selector withObject:self];
            }
        }
    }

- (void)notifyObserverWithSelector:(SEL)selector
              withObservableObject:(id)array
                        withObject:(id)user {
    NSMutableSet *observerSet = self.mutableObserverSet;
    for (id observer in observerSet) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:array withObject:user];
        }
    }
}

@end


