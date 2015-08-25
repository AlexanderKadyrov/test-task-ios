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
#import "BitViewController.h"
#import "ArrayViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.tabBarController = [[UITabBarController alloc] init];
    
    PhotoViewController *controllerOne = [MainController getViewController:@"PhotoViewController"];
    controllerOne.title = @"Photos";
    UINavigationController *navigationControllerOne = [[UINavigationController alloc] initWithRootViewController:controllerOne];
    
    BitViewController *controllerTwo = [MainController getViewController:@"BitViewController"];
    controllerTwo.title = @"Zero Bits";
    UINavigationController *navigationControllerTwo = [[UINavigationController alloc] initWithRootViewController:controllerTwo];
    
    ArrayViewController *controllerThree = [MainController getViewController:@"ArrayViewController"];
    controllerThree.title = @"Array";
    UINavigationController *navigationControllerThree = [[UINavigationController alloc] initWithRootViewController:controllerThree];
    
    self.tabBarController.viewControllers = @[navigationControllerOne, navigationControllerTwo, navigationControllerThree];
    
    self.window.rootViewController = self.tabBarController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end