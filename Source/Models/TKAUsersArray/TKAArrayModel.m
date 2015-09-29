//
//  TKAArrayModel.m
//  IOSHomeWork
//
//  Created by Taisiya on 26.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAArrayModel.h"

@interface TKAArrayModel ()
@property (nonatomic, strong) NSMutableArray *mutableUsers;

@end

@implementation TKAArrayModel

@dynamic users;

#pragma mark -
#pragma mark Class Method

+ (instancetype)users {
    return [TKAArrayModel new];
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
    [self setState:TKAArrayModelAddUser withObject:user];
}

- (void)addUser:(TKAUser *)user atIndex:(NSUInteger)index {
    [self.mutableUsers insertObject:user atIndex:index];
    [self setState:TKAArrayModelAddUser withObject:user];
}

- (void)removeUser:(TKAUser *)user {
    [self.mutableUsers removeObject:user];
    [self setState:TKAArrayModelRemoveUser withObject:user];
}

- (void)removeUserAtIndex:(NSUInteger)index {
    [self.mutableUsers removeObjectAtIndex:index];
    [self setState:TKAArrayModelRemoveUser withObject:[self.mutableUsers objectAtIndex:index]];
}

- (TKAUser *)userAtIndex:(NSUInteger)index {
    return [self.mutableUsers objectAtIndex:index];
}

- (NSUInteger)indexOfObject:(TKAUser *)user {
    return [self.mutableUsers indexOfObject:user];
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
    return [super selectorForState:state];
}

@end

