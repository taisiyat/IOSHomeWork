//
//  TKAUserCell.m
//  IOSHomeWork
//
//  Created by Taisiya on 04.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAUserCell.h"
#import "TKAUser.h"

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
    TKASynthesizeObservingSetter(user, user);
    [self fillWithModel:_user];
    [_user load];
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(TKAUser *)user {
    self.nameLabel.text = user.name;
    if (user.image) {
        self.image.image = user.image;
    } else {
        [user load];
    }
}

#pragma mark -
#pragma mark TKAModelObserver

- (void)modelWillLoad:(TKAUser *)user {
    [self.spinner startAnimating];
}

- (void)modelDidLoad:(TKAUser *)user {
    [self fillWithModel:user];
    [self.spinner stopAnimating];
}

- (void)modelFailLoad:(TKAUser *)user {
//    [self.user load];
}

- (void)modelDidFailLoad:(TKAUser *)user {
    
}

@end
