//
//  MainController.h
//  Test
//
//  Created by Alexander on 23.08.15.
//  Copyright (c) 2015 Alexander Kadyrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Constants.h"

@interface MainController : NSObject

#pragma mark -
#pragma mark Singleton

+ (MainController *)shared;

#pragma mark -
#pragma mark ViewControllers

+ (id)getViewController:(NSString *)controller;

@end
