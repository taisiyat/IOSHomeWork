//
//  TKAUsers.h
//  IOSHomeWork
//
//  Created by Taisiya on 22.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TKAUser;

@interface TKAUsers : NSObject
@property (nonatomic, readonly) NSArray *users;

+ (instancetype)users;

- (void)addUser:(TKAUser *)user;
- (void)addUser:(TKAUser *)user atIndex:(NSUInteger)index;
- (void)removeUser:(TKAUser *)user;
- (void)removeUserAtIndex:(NSUInteger)index;
- (TKAUser *)userAtIndex:(NSUInteger)index;
- (id)objectAtIndexSubscript:(NSUInteger)index;
- (void)moveUserAtIndex:(NSUInteger)sourceIndex
                toIndex:(NSUInteger)destinationIndex;
- (NSUInteger)countOfUsers;

@end
