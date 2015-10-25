//
//  TKALoadingView.h
//  IOSHomeWork
//
//  Created by Taisiya on 08.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TKALoadingView : UIView
@property (nonatomic, assign, getter=isVisible) BOOL visible;

+ (instancetype)visibleViewWithSuperview:(UIView *)superView;

- (void)setVisible:(BOOL)visible animate:(BOOL)animate;
- (void)setVisible:(BOOL)visible animate:(BOOL)animate completion:(void(^)())completion;

@end
