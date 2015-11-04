//
//  TKAUser.h
//  IOSHomeWork
//
//  Created by Taisiya on 22.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "TKAModel.h"

@class TKAImageModel;

@interface TKAUser : TKAModel <NSCoding>
@property (nonatomic, copy)     NSString      *name;
@property (nonatomic, readonly) TKAImageModel *imageModel;

+ (instancetype)user;

@end
