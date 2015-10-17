//
//  TKAVisibleView.h
//  IOSHomeWork
//
//  Created by Taisiya on 08.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TKAVisibleView : UIView
@property (nonatomic, assign, getter = isVisible) BOOL visible;

+ (instancetype)visibleViewWithSuperView:(UIView *)superView;

//- (void)visible;
//- (void)setVisible:(BOOL)visible;
- (void)setVisible:(BOOL)visible animate:(BOOL)animate;
- (void)setVisible:(BOOL)visible animate:(BOOL)animate completion:(void(^)())completion;

@end
