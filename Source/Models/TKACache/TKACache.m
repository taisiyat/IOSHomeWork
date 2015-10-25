//
//  TKACache.m
//  IOSHomeWork
//
//  Created by Taisiya on 22.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKACache.h"

@interface TKACache ()
@property (nonatomic, assign) NSMapTable *objects;

@end

@implementation TKACache

+ (TKACache *)sharedCache {
    return nil;
}

- (id)objectForKey:(id)key {
    
    return nil;
}

- (void)setObject:(id)obj forKey:(id)key {
    
}
- (void)removeObjectForKey:(id)key {
    
}
- (void)removeAllObjects {
    
}

- (BOOL)containObjectForKey:(id)key {
    
    return NO;
}

@end
