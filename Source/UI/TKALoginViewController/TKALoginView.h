//
//  TKALoginView.h
//  IOSHomeWork
//
//  Created by Taisiya on 04.11.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface TKALoginView : UIView
@property (nonatomic, strong) IBOutlet FBSDKLoginButton *loginButton;
@property (nonatomic, strong) IBOutlet UITextField      *emailTextFild;
@property (nonatomic, strong) IBOutlet UITextField      *passwordTextfild;

@end
