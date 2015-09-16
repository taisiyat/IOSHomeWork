//
//  UIViewController+TKAExtension.m
//  IOSHomeWork
//
//  Created by Taisiya on 16.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "UIViewController+TKAExtension.h"

@implementation UIViewController (TKAExtension)

+ (instancetype)viewController {
    return [[self alloc] initWithNibName:[self nibName] bundle:nil];
}

+ (NSString *)nibName {
    return nil;
}

@end
