//
//  TKAUsers.h
//  IOSHomeWork
//
//  Created by Taisiya on 26.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAArrayModel.h"

@interface TKAUsers : TKAArrayModel <NSCoding>
@property (nonatomic, copy) NSString *fileFolder;
@property (nonatomic, copy) NSString *filePath;

+ (instancetype)users;

- (BOOL)fileExists;
- (void)performLoading;
- (void)save;

@end
