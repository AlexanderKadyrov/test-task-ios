//
//  MusicViewController.m
//  Test
//
//  Created by Alexander on 22.02.16.
//  Copyright © 2016 Alexander Kadyrov. All rights reserved.
//

#import "MusicViewController.h"

@interface MusicViewController ()

@end

@implementation MusicViewController

#pragma mark -
#pragma mark Initializate

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Music";
    
    [self makeToolBar];
    
    [self makeItems];
    
    [self loadData];
}

#pragma mark -
#pragma mark Make

- (void)makeToolBar {
    
}

- (void)makeItems {
    
}

#pragma mark -
#pragma mark Load

- (void)loadData {
    
}

#pragma mark -
#pragma mark Set

- (void)setData {
    
}

#pragma mark -
#pragma mark Actions

#pragma mark -
#pragma mark Other

#pragma mark -
#pragma mark Memory managment

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end