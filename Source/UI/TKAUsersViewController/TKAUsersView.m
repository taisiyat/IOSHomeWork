//
//  TKAUsersView.m
//  IOSHomeWork
//
//  Created by Taisiya on 04.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAUsersView.h"

//#import "TKALoadingView.h"

@implementation TKAUsersView

#pragma mark -
#pragma mark Initializations and Deaallocations

- (void)awakeFromNib {
    [super awakeFromNib];
//    TKAVisibleView *loadingView = [TKAVisibleView visibleViewWithSuperView:[[UIApplication sharedApplication] keyWindow]];
//    TKAVisibleView *loadingView = [TKALoadingView visibleViewWithSuperView:self];
//    self.visibleView = loadingView;
    self.editing = NO;
}

#pragma mark -
#pragma mark Accessors

- (void)setEditing:(BOOL)editing {
    [self setEditing:editing animated:NO];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [self.tableView setEditing:editing animated:animated];
}

- (BOOL)isEditing {
    return self.tableView.editing;
}

- (void)show {
    [self hideLoadingView];
}

- (void)hide {
    [self showLoadingView];
}

@end
