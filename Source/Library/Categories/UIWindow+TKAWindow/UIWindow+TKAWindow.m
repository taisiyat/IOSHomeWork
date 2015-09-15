//
//  UIWindow+TKAWindow.m
//  IOSHomeWork
//
//  Created by Taisiya on 15.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "UIWindow+TKAWindow.h"

@implementation UIWindow (TKAWindow)

+ (instancetype)mainwindow {
    return [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end
