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
    self.state = TKAUsersArrayAddUser;
}

- (void)addUser:(TKAUser *)user atIndex:(NSUInteger)index {
    [self.mutableUsers insertObject:user atIndex:index];
    self.state = TKAUsersArrayAddUser;
}

- (void)removeUser:(TKAUser *)user {
    [self.mutableUsers removeObject:user];
    self.state = TKAUsersArrayRemoveUser;
}

- (void)removeUserAtIndex:(NSUInteger)index {
    [self.mutableUsers removeObjectAtIndex:index];
    self.state = TKAUsersArrayRemoveUser;
}

- (TKAUser *)userAtIndex:(NSUInteger)index {
    return [self.mutableUsers objectAtIndex:index];
}

- (id)objectAtIndexSubscript:(NSUInteger)index {
    if (index < [self.mutableUsers count]) {
        return [self.mutableUsers objectAtIndexedSubscript:index];
    }
    
    return nil;
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

#pragma mark -
#pragma mark Overloaded Methods

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case TKAUsersArrayAddUser:
            return @selector(usersArrayDidChange);
        case TKAUsersArrayRemoveUser:
            return @selector(usersArrayDidChange);
        default:
            return [super selectorForState:state];
    }
}

@end

