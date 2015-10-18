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

#import "NSMutableArray+TKAExtension.h"
#import "NSFileManager+TKAExtension.h"

static NSString * const kTKAArray           = @"ArrayDate";
//static NSString * const kTKAFileName        = @"usersArray";
//static NSString * const kTKAKeyArrayModel   = @"TKAArrayModel";
 
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
        [self setState:TKAModelChange
            withObject:[TKAChangeModel insertModelWithIndex:[self indexOfObject:unit]]];
    }
}

- (void)addUnit:(id)unit atIndex:(NSUInteger)index {
    [self.mutableUnits insertObject:unit atIndex:index];
    [self setState:TKAModelChange
        withObject:[TKAChangeModel insertModelWithIndex:index]];
}

- (void)removeUnit:(id)unit {
    NSUInteger index = [self indexOfObject:unit];
    [self.mutableUnits removeObject:unit];
    [self setState:TKAModelChange
        withObject:[TKAChangeModel deleteModelWithIndex:index]];
}

- (void)removeUnitAtIndex:(NSUInteger)index {
    [self.mutableUnits removeObjectAtIndex:index];
    [self setState:TKAModelChange
        withObject:[TKAChangeModel deleteModelWithIndex:index]];
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
    [self.mutableUnits moveObjectFromLocationIndex:sourceIndex
                                     toTargetIndex:destinationIndex];
    [self setState:TKAModelChange
        withObject:[TKAChangeModel moveModelWithLocationIndex:sourceIndex withTargetIndex:destinationIndex]];
}

@end

