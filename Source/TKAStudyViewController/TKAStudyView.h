//
//  TKAStudyView.h
//  IOSHomeWork
//
//  Created by Taisiya on 30.06.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TKAStudying;

@interface TKAStudyView : UIView
@property (nonatomic, strong) IBOutlet UILabel *label;
@property (nonatomic, strong) IBOutlet UIButton *button;

@property (nonatomic, strong) TKAStudying *studying;

- (void)fillWithStudying:(TKAStudying *)studying;
- (void)rotateLabel;

@end
