//
//  TKAUsersArray.m
//  IOSHomeWork
//
//  Created by Taisiya on 26.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAUsersArray.h"

@interface TKAUsersArray ()
@property (nonatomic, strong) NSMutableArray *mutableUsers;

@end

@implementation TKAUsersArray

@dynamic users;

#pragma mark -
#pragma mark Class Method

+ (instancetype)users {
    return [TKAUsersArray new];
}

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

- (NSUInteger)count {
    return [self.mutableUsers count];
}

#pragma mark -
#pragma mark Public

- (void)addUser:(TKAUser *)user {
    [self.mutableUsers addObject:user];
    self.state = TKAUsersArrayAdd;
}

- (void)addUser:(TKAUser *)user atIndex:(NSUInteger)index {
    [self.mutableUsers insertObject:user atIndex:index];
    self.state = TKAUsersArrayAdd;
}

- (void)removeUser:(TKAUser *)user {
    [self.mutableUsers removeObject:user];
    self.state = TKAUsersArrayDelete;
}

- (void)removeUserAtIndex:(NSUInteger)index {
    [self.mutableUsers removeObjectAtIndex:index];
    self.state = TKAUsersArrayDelete;
}

- (TKAUser *)userAtIndex:(NSUInteger)index {
    return [self.mutableUsers objectAtIndex:index];
}

- (id)objectAtIndexSubscript:(NSUInteger)index {
    assert(index < [self.mutableUsers count]);
    
    return [self.mutableUsers objectAtIndexedSubscript:index];
}

- (void)moveUserAtIndex:(NSUInteger)sourceIndex
                toIndex:(NSUInteger)destinationIndex
{
    TKAUser *user = [self userAtIndex:sourceIndex];
    [self removeUserAtIndex:sourceIndex];
    [self addUser:user atIndex:destinationIndex];
}

- (NSUInteger)countOfUsers {
    return [self.mutableUsers count];
}


@end

