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

static const NSTimeInterval kTKASleepTime = 1;

@implementation TKAModel

#pragma mark -
#pragma mark Overloaded Methods

- (void)load {
    TKAModelState state = self.state;
    
    if (TKAModelWillLoad == state || TKAModelDidLoad == state) {
//        [self notifyOfStateChangeWithSelector]
        return;
    }
   
    self.state = TKAModelWillLoad;
    
    TKAWeakifyVariable(self)
    
    TKAPerformBlockAsyncBackground(^{
        TKAStrongifyVariableAndReturnEmptyIfNil(self);
        [self performLoading];
        
        TKAPerformBlockSyncOnMainQueue(^{
            self.state = TKAModelDidLoad;
        });
    });
}

- (void)performLoading {
    [self doesNotRecognizeSelector:_cmd];
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

        case TKAModelNotChange:
            return nil;
            
        default:
            return [super selectorForState:state];
    }
}

@end
