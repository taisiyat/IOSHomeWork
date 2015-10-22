//
//  TKACache.h
//  IOSHomeWork
//
//  Created by Taisiya on 22.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TKACache : NSObject

+ (TKACache *)sharedCache;

- (id)objectForKey:(id)key;
- (void)setObject:(id)obj forKey:(id)key;
- (void)removeObjectForKey:(id)key;
- (void)removeAllObjects;
- (BOOL)containObjectForKey:(id)key;

@end
