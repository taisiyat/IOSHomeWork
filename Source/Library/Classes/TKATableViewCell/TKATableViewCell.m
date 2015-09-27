//
//  TKATableViewCell.m
//  IOSHomeWork
//
//  Created by Taisiya on 22.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKATableViewCell.h"

@implementation TKATableViewCell

#pragma mark - 
#pragma mark Accessor

- (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

@end
