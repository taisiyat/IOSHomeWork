//
//  TKATableView.m
//  IOSHomeWork
//
//  Created by Taisiya on 22.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKATableView.h"

@implementation TKATableView

#pragma mark -
#pragma mark Initializations and Deaallocations

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.editing = NO;
}

#pragma mark - 
#pragma mark Accessors

- (void)setEditing:(BOOL)editing {
    [self setEditing:editing animated:NO];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [self.usersTableView setEditing:editing animated:animated];
}

- (BOOL)isEditing {
    return self.usersTableView.editing;
}

@end
