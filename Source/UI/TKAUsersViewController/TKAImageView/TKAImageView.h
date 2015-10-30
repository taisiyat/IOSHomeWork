//
//  TKAImageView.h
//  IOSHomeWork
//
//  Created by Taisiya on 22.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TKABaseView.h"
#import "TKAModel.h"

@class TKAImageModel;

@interface TKAImageView : UIImageView <TKAModelObserver>
@property (nonatomic, strong)        TKAImageModel *imageModel;

@end
