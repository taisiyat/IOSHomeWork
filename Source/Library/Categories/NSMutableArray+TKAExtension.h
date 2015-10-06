//
//  NSMutableArray+TKAExtension.h
//  IOSHomeWork
//
//  Created by Taisiya on 06.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (TKAExtension)

- (void)moveObjectFromLocationIndex:(NSUInteger)locationIndex
                      toTargetIndex:(NSUInteger)targetIndex;

@end
