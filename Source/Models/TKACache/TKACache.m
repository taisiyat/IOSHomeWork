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
    static TKACache *__object = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __object = [TKACache new];
    });
    
    return __object;
}

-(void)dealloc {
    self.objects = nil;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.objects = [NSMapTable strongToWeakObjectsMapTable];
    }

    return self;
}

- (id)objectForKey:(id)key {
    @synchronized (self) {
        return [self.objects objectForKey:key];
    }
}

- (void)setObject:(id)object forKey:(id)key {
    @synchronized (self) {
        if (![self objectForKey:key] && object)
        [self.objects setObject:object forKey:key];
    }
}
- (void)removeObjectForKey:(id)key {
    @synchronized (self) {
        [self.objects removeObjectForKey:key];
    }
}
- (void)removeAllObjects {
    @synchronized (self) {
        [self.objects removeAllObjects];
    }
}

- (BOOL)containObjectForKey:(id)key {
    @synchronized (self) {
//        if ([self objectForKey:key]) {
//            return YES;
//        }
//        
//        return NO;
        
        return nil != [self objectForKey:key];
    }
}

@end
