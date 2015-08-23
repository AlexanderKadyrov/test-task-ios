//
//  PhotoViewController.m
//  Test
//
//  Created by Alexander on 23.08.15.
//  Copyright (c) 2015 Alexander Kadyrov. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoCollectionViewCell.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

#pragma mark -
#pragma mark Initializate

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Photos";
    
    [self makeToolBar];
    
    [self makeItems];
    
    [self loadData];
}

#pragma mark -
#pragma mark Make

- (void)makeToolBar {
    
}

- (void)makeItems {
    assetsLibrary = [MainController sharedAssetsLibrary];
    list = [[NSMutableArray alloc] init];
    
    UINib *nib = [UINib nibWithNibName:[NSString stringWithFormat:@"PhotoCollectionViewCell_%@", DEVICE_NAME] bundle: nil];
    [collectionView registerNib:nib forCellWithReuseIdentifier:IDENTIFIER_CELL];
}

#pragma mark -
#pragma mark Load

- (void)loadData {
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        
        [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            
            if (result) {
                [list addObject:result];
            }
        }];
        
        [self setData];
        
    } failureBlock:^(NSError *error) {
        NSLog(@"Error - %@", error.localizedDescription);
    }];
}

#pragma mark -
#pragma mark Set

- (void)setData {
    [collectionView reloadData];
}

#pragma mark -
#pragma mark Actions

#pragma mark -
#pragma mark UICollectionView

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)_collectionView numberOfItemsInSection:(NSInteger)section {
    return list.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)_collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = IDENTIFIER_CELL;
    
    PhotoCollectionViewCell *cell = (PhotoCollectionViewCell *)[_collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.asset = list[indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark Other

#pragma mark -
#pragma mark Memory managment

@end