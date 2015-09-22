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
@property (nonatomic, assign) NSArray *users;

- (void)addUser:(TKAUser *)user;
- (void)removeUser:(TKAUser *)user;
- (void)removeUserAtIndex:(NSUInteger)index;
- (TKAUser *)userAtIndex:(NSUInteger)index;
- (void)sortUsers:(TKAUser *)user;
- (NSUInteger)countOfUsers;

@end
