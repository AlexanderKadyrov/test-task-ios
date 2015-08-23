//
//  PhotoViewController.m
//  Test
//
//  Created by Alexander on 23.08.15.
//  Copyright (c) 2015 Alexander Kadyrov. All rights reserved.
//

#import "PhotoViewController.h"

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
    assetsLibrary = [[ALAssetsLibrary alloc] init];
    list = [[NSMutableArray alloc] init];
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
#pragma mark Collection view data source

- (NSInteger)collectionView:(UICollectionView *)_collectionView numberOfItemsInSection:(NSInteger)section {
    return list.count;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)_collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = (UICollectionViewCell *)[_collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    
    //ALAsset *asset = list[indexPath.row];
    //cell.asset = asset;
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

- (CGFloat) collectionView:(UICollectionView *)_collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 4;
}

- (CGFloat) collectionView:(UICollectionView *)_collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 1;
}

#pragma mark -
#pragma mark Other

#pragma mark -
#pragma mark Memory managment

@end