//
//  TKALoadingView.h
//  IOSHomeWork
//
//  Created by Taisiya on 16.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TKAVisibleView;

@interface TKALoadingView : UIView
@property (nonatomic, strong) IBOutlet TKAVisibleView *visibleView;
@property (nonatomic, readonly, getter=isHidden) BOOL hidden;

- (void)showLoadingView;
- (void)hideLoadingView;
- (id)reloadLoadingView;

@end
