//
//  TKAAppDelegate.m
//  IOSHomeWork
//
//  Created by Taisiya on 24.06.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAAppDelegate.h"
#import "TKAStudyViewController.h"
#import "TKAViewController.h"

#import "TKAStudying.h"

@interface TKAAppDelegate ()

@end

@implementation TKAAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window = window;

    window.rootViewController = [TKAViewController new];
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
