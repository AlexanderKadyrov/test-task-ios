//
//  ViewController.m
//  Test
//
//  Created by Alexander on 23.08.15.
//  Copyright (c) 2015 Alexander Kadyrov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark -
#pragma mark Initializate

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark -
#pragma mark Set Button Left

- (void)setButtonRightTitle:(NSString *)title selector:(SEL)selector {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:selector];
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor blackColor]];
}

#pragma mark -
#pragma mark Memory managment

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end