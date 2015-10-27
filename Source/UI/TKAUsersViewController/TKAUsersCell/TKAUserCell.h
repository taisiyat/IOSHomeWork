//
//  TKAUserCell.h
//  IOSHomeWork
//
//  Created by Taisiya on 04.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TKATableViewCell.h"
#import "TKAImageView.h"
#import "TKAModel.h"

@class TKAUser;

@interface TKAUserCell : TKATableViewCell <TKAModelObserver>
@property (nonatomic, strong) IBOutlet UILabel        *nameLabel;
//@property (nonatomic, strong) IBOutlet UIImageView  *image;
@property (nonatomic, strong)           TKAImageView  *image;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *spinner;

@property (nonatomic, strong) TKAUser               *user;

- (void)fillWithModel:(TKAUser *)user;

@end
