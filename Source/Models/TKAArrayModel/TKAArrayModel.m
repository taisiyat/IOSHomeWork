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

//static NSString * const kTKAArray           = @"ArrayDate";
static NSString * const kTKAKeyArrayModel   = @"TKAArrayModel";
 
@interface TKAArrayModel ()
@property (nonatomic, strong) NSMutableArray *mutableUnits;

@end

@implementation TKAArrayModel

@dynamic units;

#pragma mark -
#pragma mark Class Method

+ (instancetype)arrayModel {
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
    [self addUnit:unit atIndex:[self.mutableUnits count]];
}

- (void)addUnit:(id)unit atIndex:(NSUInteger)index {
    [self.mutableUnits insertObject:unit atIndex:index];
    [self setState:TKAModelDidChange
        withObject:[TKAChangeModel insertModelWithIndex:index]];
}

- (void)removeUnit:(id)unit {
    [self removeUnitAtIndex:[self indexOfObject:unit]];
}

- (void)removeUnitAtIndex:(NSUInteger)index {
    [self.mutableUnits removeObjectAtIndex:index];
    [self setState:TKAModelDidChange
        withObject:[TKAChangeModel deleteModelWithIndex:index]];
}

- (id)unitAtIndex:(NSUInteger)index {
    return [self.mutableUnits objectAtIndex:index];
}

- (NSUInteger)indexOfObject:(id)unit {
    return [self.mutableUnits indexOfObject:unit];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    NSMutableArray *units = self.mutableUnits;
//    assert(index < [units count]);
    if (index < [units count]) {
        return [units objectAtIndexedSubscript:index];
    }
    
    return nil;
}

- (void)moveUnitAtIndex:(NSUInteger)sourceIndex
                toIndex:(NSUInteger)destinationIndex
{
    [self.mutableUnits moveObjectFromLocationIndex:sourceIndex
                                     toTargetIndex:destinationIndex];
    [self setState:TKAModelDidChange
        withObject:[TKAChangeModel moveModelWithLocationIndex:sourceIndex withTargetIndex:destinationIndex]];
}

#pragma mark -
#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.mutableCopy forKey:kTKAKeyArrayModel];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self) {
        self.mutableUnits = [decoder decodeObjectForKey:kTKAKeyArrayModel];
    }

    return self;
}

@end

