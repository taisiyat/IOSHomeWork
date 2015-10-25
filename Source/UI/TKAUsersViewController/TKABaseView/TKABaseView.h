//
//  TKABaseView.h
//  IOSHomeWork
//
//  Created by Taisiya on 16.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TKALoadingView;

@interface TKABaseView : UIView
@property (nonatomic, strong) TKALoadingView    *loadingView;
@property (nonatomic, readonly, getter=isHidden) BOOL hidden;

- (void)showLoadingView;
- (void)hideLoadingView;
- (id)newLoadingView;

@end
