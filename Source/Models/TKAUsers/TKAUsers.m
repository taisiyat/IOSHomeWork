//
//  TKAUsers.m
//  IOSHomeWork
//
//  Created by Taisiya on 22.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAUsers.h"

@interface TKAUsers ()
@property (nonatomic, assign) NSMutableArray *mutableUsers;

@end

@implementation TKAUsers

@dynamic users;

//#pragma mark -
//#pragma mark Class Method
//
//+ (instancetype)users {
//    return [TKAUsers new];
//}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableUsers = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)users {
    return [self.mutableUsers copy];
}

#pragma mark -
#pragma mark Public 

- (void)addUser:(TKAUser *)user {
    [self.mutableUsers addObject:user];
}

- (void)removeUser:(TKAUser *)user {
    [self.mutableUsers removeObject:user];
}

- (void)removeUserAtIndex:(NSUInteger)index {
    [self.mutableUsers removeObjectAtIndex:index];
}

- (TKAUser *)userAtIndex:(NSUInteger)index {
    return [self.mutableUsers objectAtIndex:index];
}

- (void)sortUsers:(TKAUser *)user {
}

- (NSUInteger)countOfUsers {
    return [self.mutableUsers count];
}

@end
