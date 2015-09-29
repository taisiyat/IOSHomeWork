//
//  TKAArrayModel.h
//  IOSHomeWork
//
//  Created by Taisiya on 26.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TKAObservableObject.h"

@class TKAUser;

typedef NS_ENUM(NSUInteger, TKAArrayModelState) {
    TKAArrayModelNotChange,
    TKAArrayModelAddUser,
    TKAArrayModelRemoveUser,
};

@protocol TKAArrayModelObsserver <NSObject>

@optional
- (void)usersArrayDidChange;
- (void)usersArrayDidChangeObject:(id)object;

@end

@interface TKAArrayModel : TKAObservableObject <TKAArrayModelObsserver>
@property (nonatomic, readonly) NSArray     *users;
@property (nonatomic, readonly) NSUInteger  count;

+ (instancetype)usersArray;

- (void)addUser:(TKAUser *)user;
- (void)addUser:(TKAUser *)user atIndex:(NSUInteger)index;
- (void)removeUser:(TKAUser *)user;
- (void)removeUserAtIndex:(NSUInteger)index;
- (TKAUser *)userAtIndex:(NSUInteger)index;
- (NSUInteger)indexOfObject:(TKAUser *)user;
- (id)objectAtIndexSubscript:(NSUInteger)index;
- (void)moveUserAtIndex:(NSUInteger)sourceIndex
                toIndex:(NSUInteger)destinationIndex;
- (NSUInteger)countOfUsers;

@end
