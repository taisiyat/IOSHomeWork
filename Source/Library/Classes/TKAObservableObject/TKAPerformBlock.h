//
//  TKAPerformBlock.h
//  IOSHomeWork
//
//  Created by Taisiya on 27.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#ifndef IOSHomeWork_TKAPerformBlock_h
#define IOSHomeWork_TKAPerformBlock_h

typedef void(^TKABlock)();

void TKAPerformBlockSyncOnMainQueue(TKABlock block);
void TKAPerformBlockAsyncOnMainQueue(TKABlock block);
void TKAPerformBlockAsyncBackground(TKABlock block);

#endif
