//
//  TKAAppDelegate.m
//  IOSHomeWork
//
//  Created by Taisiya on 24.06.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "TKAAppDelegate.h"

#import "TKAViewController.h"
#import "TKAUsersViewController.h"
#import "TKALoginViewController.h"
#import "TKAUsers.h"

#import "UIWindow+TKAExtension.h"
#import "UIViewController+TKAExtension.h"

@interface TKAAppDelegate ()
//@property (nonatomic, assign) TKAUsers *users;

@end

@implementation TKAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    
    UIWindow *window = [UIWindow window];
    self.window = window;
    
//    TKAUsersViewController *controller = [TKAUsersViewController viewController];
//    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
//    window.rootViewController = navController;
//    
//    TKAUsers *users = [TKAUsers users];
//    controller.users = users;
//    self.users = users;
 
    TKALoginViewController *controller = [TKALoginViewController viewController];
    window.rootViewController = controller;

    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBSDKAppEvents activateApp];
}

- (void)applicationWillTerminate:(UIApplication *)application {

}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
}

@end
