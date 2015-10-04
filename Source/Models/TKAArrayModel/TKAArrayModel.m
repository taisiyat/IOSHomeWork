//
//  TKAArrayModel.m
//  IOSHomeWork
//
//  Created by Taisiya on 26.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAArrayModel.h"
#import "TKAChangeModel.h"
#import "TKAChangeModelOneIndex.h"
#import "TKAUser.h"

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
    if ([self.observerSet anyObject] != nil) {
        NSIndexPath *userIndexPath = [self indexPathOfObject:user];
        [self setState:TKAArrayModelChange withObject:[TKAChangeModel insertModelWithIndexPath:userIndexPath]];
    }
}

- (void)addUser:(TKAUser *)user atIndex:(NSUInteger)index {
    [self.mutableUsers insertObject:user atIndex:index];
    NSIndexPath *userIndexPath = [NSIndexPath indexPathForRow:index];
    [self setState:TKAArrayModelChange
        withObject:[TKAChangeModel insertModelWithIndexPath:userIndexPath]];
}

- (void)removeUser:(TKAUser *)user {
    NSIndexPath *userIndexPath = [self indexPathOfObject:user];
    [self.mutableUsers removeObject:user];
    [self setState:TKAArrayModelChange
        withObject:[TKAChangeModel deleteModelWithIndexPath:userIndexPath]];
}

- (void)removeUserAtIndex:(NSUInteger)index {
    [self.mutableUsers removeObjectAtIndex:index];
    NSIndexPath *userIndexPath = [NSIndexPath indexPathForRow:index];
    [self setState:TKAArrayModelChange
        withObject:[TKAChangeModel deleteModelWithIndexPath:userIndexPath]];
}

- (TKAUser *)userAtIndex:(NSUInteger)index {
    return [self.mutableUsers objectAtIndex:index];
}

- (NSUInteger)indexOfObject:(TKAUser *)user {
    return [self.mutableUsers indexOfObject:user];
}

- (NSIndexPath *)indexPathOfObject:(TKAUser *)user {
    return [NSIndexPath indexPathForRow:[self.mutableUsers indexOfObject:user]];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
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
        case TKAArrayModelChange:
            return @selector(arrayModel:didChangeWithObject:);
            
        case TKAArrayModelNotChange:
            return nil;
            
        default:
            return [super selectorForState:state];
    }
}

@end

