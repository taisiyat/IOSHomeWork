//
//  TKAModel.m
//  IOSHomeWork
//
//  Created by Taisiya on 17.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAModel.h"

#import "TKAPerformBlock.h"

#import "TKAMacros.h"

@implementation TKAModel

#pragma mark -
#pragma mark Overloaded Methods

- (void)load {
    TKAModelState state = self.state;
    
    if (TKAModelWillLoad == state || TKAModelDidLoad == state) {
        [self notifyOfStateWithSelector:[self selectorForState:state]];
        
        return;
    }
   
    [self setupLoading];
    
//    TKAWeakifyVariable(self)
    TKAPerformBlockAsyncOnBackgroundQueue(^{
//        TKAStrongifyVariableAndReturnEmptyIfNil(self);
        [self performLoading];
        [self finishLoading];
    });
}

- (void)performLoading {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)setupLoading {
    self.state = TKAModelWillLoad;
}

- (void)finishLoading {
    TKAPerformBlockSyncOnMainQueue(^{
        self.state = TKAModelDidLoad;
    });
}

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case TKAModelChange:
            return @selector(model:didChangeWithObject:);
            
        case TKAModelWillLoad:
            return @selector(modelWillLoad:);
        
        case TKAModelDidLoad:
            return @selector(modelDidLoad:);
            
        case TKAModelFailLoad:
            return @selector(modelFailLoad:);
            
        case TKAModelDidFailLoad:
            return @selector(modelDidFailLoad:);
         
        default:
            return [super selectorForState:state];
    }
}

@end
