//
//  TKAUsers.h
//  IOSHomeWork
//
//  Created by Taisiya on 26.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAArrayModel.h"

@interface TKAUsers : TKAArrayModel 

+ (instancetype)users;

- (BOOL)fileExists;
- (void)performLoading;
- (void)save;

@end
