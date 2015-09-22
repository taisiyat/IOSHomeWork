//
//  TKATableCell.h
//  IOSHomeWork
//
//  Created by Taisiya on 22.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKATableViewCell.h"

@class TKAUser;
@class TKAUsers;

@interface TKATableCell : TKATableViewCell
@property (nonatomic, strong) IBOutlet UILabel      *nameLabel;
@property (nonatomic, strong) IBOutlet UIImageView  *image;

@property (nonatomic, strong) TKAUser               *user;

- (void)fillWithModel:(TKAUser *)user;

@end
