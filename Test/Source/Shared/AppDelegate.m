//
//  AppDelegate.m
//  Test
//
//  Created by Alexander on 23.08.15.
//  Copyright (c) 2015 Alexander Kadyrov. All rights reserved.
//

#import "AppDelegate.h"
#import "MainController.h"
#import "PhotoViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    PhotoViewController *controller = [MainController getViewController:@"PhotoViewController"];
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end