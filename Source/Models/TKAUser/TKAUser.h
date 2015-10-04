//
//  TKAUser.h
//  IOSHomeWork
//
//  Created by Taisiya on 22.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TKAUser : NSObject
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, readonly) UIImage     *image;
@property (nonatomic, assign) NSUInteger     state;
@property (nonatomic, assign) NSUInteger     index;

+ (instancetype)user;

@end
