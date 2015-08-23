//
//  PhotoDetailViewController.m
//  Test
//
//  Created by Alexander on 24.08.15.
//  Copyright (c) 2015 Alexander Kadyrov. All rights reserved.
//

#import "PhotoDetailViewController.h"

@interface PhotoDetailViewController ()

@end

@implementation PhotoDetailViewController

#pragma mark -
#pragma mark Initializate

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Detail";
    
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
    [self setData];
}

#pragma mark -
#pragma mark Set

- (void)setData {
    ALAssetRepresentation *representation = [self.asset defaultRepresentation];
    UIImage *image = [UIImage imageWithCGImage:[representation fullScreenImage] scale:[representation scale] orientation:UIImageOrientationUp];
    imageViewPhoto.image = image;
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