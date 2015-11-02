//
//  TKAUserCell.m
//  IOSHomeWork
//
//  Created by Taisiya on 04.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAUserCell.h"
#import "TKAUser.h"
#import "TKAURLImageModel.h"

#import "TKAMacros.h"

@implementation TKAUserCell

#pragma mark -
#pragma mark Initializations and Deallocations

#pragma mark -
#pragma mark Accessor

- (void)dealloc {
    self.user = nil;
}

- (void)setUser:(TKAUser *)user {
    if (user != _user) {
        _user = user;
    }
    
    [self fillWithModel:_user];
}
    
#pragma mark -
#pragma mark Public

- (void)fillWithModel:(TKAUser *)user {
    self.nameLabel.text = user.name;
    self.imageModelView.imageModel = user.imageModel;
}

#pragma mark -
#pragma mark TKAModelObserver
//- (void)modelWillLoad:(TKAUser *)user {
//    [self.spinner startAnimating];
//}
//
//- (void)modelDidLoad:(TKAUser *)user {
//    [self fillWithModel:user];
//    [self.spinner stopAnimating];
//}
//
//- (void)modelUnload:(TKAUser *)user {
//    
//}
//
//- (void)modelDidFailLoading:(TKAUser *)user {
//    [self.user load];
//}

@end
