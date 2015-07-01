//
//  TKAStudying.m
//  IOSHomeWork
//
//  Created by Taisiya on 01.07.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAStudying.h"

@implementation TKAStudying

#pragma mark - 
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = @"name";
        self.surname = @"surname";
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)fullname {
    return [NSString stringWithFormat:@"%@ %@", self.name, self.surname];
}

@end
