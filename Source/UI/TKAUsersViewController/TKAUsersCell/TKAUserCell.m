//
//  TKAUserCell.m
//  IOSHomeWork
//
//  Created by Taisiya on 04.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAUserCell.h"
#import "TKAUser.h"

@implementation TKAUserCell

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark -
#pragma mark Accessor

- (void)setUser:(TKAUser *)user {
    if (_user != user) {
        _user = user;
        
        [self fillWithModel:user];
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(TKAUser *)user {
    self.nameLabel.text = user.name;
    self.image.image = user.image;
}

@end
