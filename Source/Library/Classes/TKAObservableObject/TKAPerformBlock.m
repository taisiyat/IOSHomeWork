//
//  TKAPerformBlock.m
//  IOSHomeWork
//
//  Created by Taisiya on 27.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TKAPerformBlock.h"

void TKAPerformBlockOnMainQueue(TKABlock block) {
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
};

void TKAPerformBlockAsyncBackground(TKABlock block);
void TKAPerformBlockSyncOnMainQueue(TKABlock block);