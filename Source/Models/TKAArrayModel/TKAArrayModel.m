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
//#import "TKAUser.h"

@interface TKAArrayModel ()
@property (nonatomic, strong) NSMutableArray *mutableUnits;

@end

@implementation TKAArrayModel

@dynamic units;

#pragma mark -
#pragma mark Class Method

+ (instancetype)units {
    return [TKAArrayModel new];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableUnits = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)units {
    return [self.mutableUnits copy];
}

- (NSUInteger)count {
    return [self.mutableUnits count];
}

#pragma mark -
#pragma mark Public

- (void)addUnit:(id)unit {
    [self.mutableUnits addObject:unit];
    if ([self.observerSet anyObject] != nil) {
        NSIndexPath *unitIndexPath = [self indexPathOfObject:unit];
        [self setState:TKAArrayModelChange
            withObject:[TKAChangeModel insertModelWithIndexPath:unitIndexPath]];
    }
}

- (void)addUnit:(id)unit atIndex:(NSUInteger)index {
    [self.mutableUnits insertObject:unit atIndex:index];
    NSIndexPath *unitIndexPath = [NSIndexPath indexPathForRow:index];
    [self setState:TKAArrayModelChange
        withObject:[TKAChangeModel insertModelWithIndexPath:unitIndexPath]];
}

- (void)removeUnit:(id)unit {
    NSIndexPath *unitIndexPath = [self indexPathOfObject:unit];
    [self.mutableUnits removeObject:unit];
    [self setState:TKAArrayModelChange
        withObject:[TKAChangeModel deleteModelWithIndexPath:unitIndexPath]];
}

- (void)removeUnitAtIndex:(NSUInteger)index {
    [self.mutableUnits removeObjectAtIndex:index];
    NSIndexPath *unitIndexPath = [NSIndexPath indexPathForRow:index];
    [self setState:TKAArrayModelChange
        withObject:[TKAChangeModel deleteModelWithIndexPath:unitIndexPath]];
}

- (id)unitAtIndex:(NSUInteger)index {
    return [self.mutableUnits objectAtIndex:index];
}

- (NSUInteger)indexOfObject:(id)unit {
    return [self.mutableUnits indexOfObject:unit];
}

- (NSIndexPath *)indexPathOfObject:(id)unit {
    return [NSIndexPath indexPathForRow:[self.mutableUnits indexOfObject:unit]];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    if (index < [self.mutableUnits count]) {
        return [self.mutableUnits objectAtIndexedSubscript:index];
    }
    
    return nil;
}

- (void)moveUnitAtIndex:(NSUInteger)sourceIndex
                toIndex:(NSUInteger)destinationIndex
{
    id unit = [self unitAtIndex:sourceIndex];
    [self removeUnitAtIndex:sourceIndex];
    [self addUnit:unit atIndex:destinationIndex];
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

