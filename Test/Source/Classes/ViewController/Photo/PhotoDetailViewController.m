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
    
    [self setData];
}

#pragma mark -
#pragma mark Make

- (void)makeToolBar {
    [self setButtonRightTitle:@"Sepia" selector:@selector(actionSetSepia)];
}

#pragma mark -
#pragma mark Set

- (void)setData {
    ALAssetRepresentation *representation = self.asset.defaultRepresentation;
    UIImage *image = [UIImage imageWithCGImage:[representation fullScreenImage] scale:[representation scale] orientation: UIImageOrientationUp];
    imageViewPhoto.image = image;
}

#pragma mark -
#pragma mark Actions

- (void)actionSetSepia {
    CIImage *originImage = [CIImage imageWithCGImage:[imageViewPhoto.image CGImage]];
    CIContext *context = [CIContext contextWithOptions:@{kCIContextUseSoftwareRenderer:@YES}];
    
    CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone" keysAndValues:kCIInputImageKey, originImage, @"inputIntensity", @(1), nil];
    CIImage *outputImage = [filter outputImage];
    
    CGImageRef imageRef = [context createCGImage:outputImage fromRect:[outputImage extent]];
    UIImage *imageWithFilter = [UIImage imageWithCGImage:imageRef];
    
    imageViewPhoto.image = imageWithFilter;
    
    [self setButtonRightTitle:@"Save" selector:@selector(actionSave)];
}

- (void)actionSave {
    NSData *data = UIImagePNGRepresentation(imageViewPhoto.image);
    
    [self.asset writeModifiedImageDataToSavedPhotosAlbum:data metadata:self.asset.defaultRepresentation.metadata completionBlock:^(NSURL *assetURL, NSError *error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_LOAD_PHOTO object:nil];
        [self.navigationController popViewControllerAnimated:YES];
    }];
}

#pragma mark -
#pragma mark Memory managment

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end