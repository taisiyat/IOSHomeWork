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
//static NSString * const kTKAFileName   = @"usersArray";
static NSString * const kTKAKeyUsers   = @"TKAKeyUsers";

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
    [self addUnit:[TKAUser user]];
}

- (void)fillWithRandomValueWithCount:(NSUInteger)count {
    for (NSUInteger index = 0; index < kTKAUsersCount; index++) {
        [self fillWithRandomValue];
    }
}

#pragma mark -
#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self forKey:kTKAKeyUsers];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self) {
        self = [decoder decodeObjectForKey:kTKAKeyUsers];
    }
    
    return self;
}


@end
