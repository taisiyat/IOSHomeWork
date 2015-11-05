//
//  TKALoginViewController.m
//  IOSHomeWork
//
//  Created by Taisiya on 03.11.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "TKALoginViewController.h"
#import "TKALoginView.h"

#import "TKAMacros.h"

static NSString* kTKAAppId = @"11111111111";
static NSString* kTKAUserEmail = @"11111111111";
static NSString* kTKAUserID = @"11111111111";

TKAViewControllerBaseViewProperty(TKALoginViewController, loginView, TKALoginView)

@implementation TKALoginViewController

#pragma mark -
#pragma mark Initializations and Dealocations

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _facebook = [[Facebook alloc] initWithAppId:kTKAAppId];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onLoginButton:(id)sender {
    self.loginView.loginButton.readPermissions =
    @[@"public_profile", @"email", @"user_friends"];
}

@end
