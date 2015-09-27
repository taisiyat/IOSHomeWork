//
//  TKAUsers.m
//  IOSHomeWork
//
//  Created by Taisiya on 26.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAUsers.h"
#import "TKAUser.h"

static const NSUInteger kTKAUsersCount = 6;

@implementation TKAUsers

#pragma mark -
#pragma mark Class Method

+ (instancetype)users {
    return [TKAUsers new];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        [self fill];
    }
    
    return self;
}

#pragma mark -
#pragma mark Private

- (void)fill {
    [self fillWithRandomValueWithCount:kTKAUsersCount];
}

- (void)fillWithRandomValue {
    [self addUser:[TKAUser user]];
}

- (void)fillWithRandomValueWithCount:(NSUInteger)count {
    for (NSUInteger index = 0; index < kTKAUsersCount; index++) {
        [self fillWithRandomValue];
    }
}

@end
