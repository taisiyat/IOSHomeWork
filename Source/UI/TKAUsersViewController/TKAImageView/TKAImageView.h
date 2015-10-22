//
//  TKAImageView.h
//  IOSHomeWork
//
//  Created by Taisiya on 22.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TKAImageModel;

@interface TKAImageView : UIView
@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong)        TKAImageModel *imageModel;

@end
