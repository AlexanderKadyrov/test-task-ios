//
//  PhotoCollectionViewCell.h
//  Test
//
//  Created by Alexander on 24.08.15.
//  Copyright (c) 2015 Alexander Kadyrov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface PhotoCollectionViewCell : UICollectionViewCell {
    IBOutlet UIImageView *imageViewPhoto;
}

@property(nonatomic, strong) ALAsset *asset;

@end
