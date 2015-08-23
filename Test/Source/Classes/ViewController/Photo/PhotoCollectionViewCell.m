//
//  PhotoCollectionViewCell.m
//  Test
//
//  Created by Alexander on 24.08.15.
//  Copyright (c) 2015 Alexander Kadyrov. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@implementation PhotoCollectionViewCell

- (void)setAsset:(ALAsset *)asset {
    _asset = asset;
    imageViewPhoto.image = [UIImage imageWithCGImage:[asset thumbnail]];
}

@end