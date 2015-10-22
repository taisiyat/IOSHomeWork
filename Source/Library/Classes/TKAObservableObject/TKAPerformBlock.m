//
//  TKAPerformBlock.m
//  IOSHomeWork
//
//  Created by Taisiya on 27.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TKAPerformBlock.h"

void TKAPerformBlockSyncOnMainQueue(TKABlock block) {
//    if ([NSThread isMainThread]) {
        block();
//    } else {
//        dispatch_sync(dispatch_get_main_queue(), block);
//    }
};

void TKAPerformBlockAsyncOnMainQueue(TKABlock block) {
//    if ([NSThread isMainThread]) {
        block();
//    } else {
//        dispatch_async(dispatch_get_main_queue(), block);
//    }
}

void TKAPerformBlockAsyncOnBackgroundQueue(TKABlock block) {
//    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), block);
    block();
}

