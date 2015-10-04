//
//  TKAUser.h
//  IOSHomeWork
//
//  Created by Taisiya on 22.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

static NSString *const kTKAImageName        = @"image";
static NSString *const kTKAImageExtension   = @"jpg";

@interface TKAUser : NSObject
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, readonly) UIImage     *image;

+ (instancetype)user;

@end
