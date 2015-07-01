//
//  TKAStudyViewController.h
//  IOSHomeWork
//
//  Created by Taisiya on 30.06.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TKAStudying;

@interface TKAStudyViewController : UIViewController
@property (nonatomic, strong) TKAStudying *studying;

- (IBAction)onRotateButton:(id)sender;

@end
