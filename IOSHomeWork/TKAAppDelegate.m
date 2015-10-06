//
//  TKAAppDelegate.m
//  IOSHomeWork
//
//  Created by Taisiya on 24.06.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAAppDelegate.h"

#import "TKAViewController.h"
#import "TKAUsersViewController.h"
#import "TKAUsers.h"

#import "UIWindow+TKAExtension.h"
#import "UIViewController+TKAExtension.h"

@interface TKAAppDelegate ()

@end

@implementation TKAAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;
    
    TKAUsersViewController *controller = [TKAUsersViewController viewController];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    controller.users = [TKAUsers users];
    window.rootViewController = navController;
    
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
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

@end
