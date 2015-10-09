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

- (void)showView;
- (void)hideView;
- (void)showViewWithAnimate:(BOOL)animate;
- (void)hideViewWithAnimate:(BOOL)animate;

@end
