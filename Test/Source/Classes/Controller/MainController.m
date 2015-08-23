//
//  MainController.m
//  Test
//
//  Created by Alexander on 23.08.15.
//  Copyright (c) 2015 Alexander Kadyrov. All rights reserved.
//

#import "MainController.h"

@implementation MainController

#pragma mark -
#pragma mark Singleton

+ (MainController *)shared {
    
    static MainController *sharedController = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedController = [[MainController alloc] init];
    });
    
    return sharedController;
}

+ (ALAssetsLibrary *)sharedAssetsLibrary {
    static dispatch_once_t pred = 0;
    static ALAssetsLibrary *library = nil;
    dispatch_once(&pred, ^{
        library = [[ALAssetsLibrary alloc] init];
    });
    return library;
}

#pragma mark -
#pragma mark ViewControllers

+ (id)getViewController:(NSString *)controller {
    NSString *controllerName = [NSString stringWithFormat:@"%@_%@", controller, DEVICE_NAME];
    return [[NSClassFromString(controllerName) alloc] initWithNibName:controllerName bundle:[NSBundle mainBundle]];
}

@end
