//
//  PhotoViewController.h
//  Test
//
//  Created by Alexander on 23.08.15.
//  Copyright (c) 2015 Alexander Kadyrov. All rights reserved.
//

#import "ViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface PhotoViewController : ViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout> {
    IBOutlet UICollectionView *collectionView;
    NSMutableArray *list;
    
    ALAssetsLibrary *assetsLibrary;
}

@end
