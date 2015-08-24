//
//  PhotoViewController.m
//  Test
//
//  Created by Alexander on 23.08.15.
//  Copyright (c) 2015 Alexander Kadyrov. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoCollectionViewCell.h"
#import "PhotoDetailViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

#pragma mark -
#pragma mark Initializate

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadData) name:NOTIFICATION_LOAD_PHOTO object:nil];
    
    self.title = @"Photos";
    
    [self makeItems];
    
    [self loadData];
}

#pragma mark -
#pragma mark Make

- (void)makeItems {
    list = [[NSMutableArray alloc] init];
    assetsLibrary = [MainController sharedAssetsLibrary];
    
    UINib *nib = [UINib nibWithNibName:[NSString stringWithFormat:@"PhotoCollectionViewCell_%@", DEVICE_NAME] bundle: nil];
    [collectionView registerNib:nib forCellWithReuseIdentifier:IDENTIFIER_CELL];
}

#pragma mark -
#pragma mark Load

- (void)loadData {
    [list removeAllObjects];
    
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
#pragma mark UICollectionView Delegate

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

- (void) collectionView:(UICollectionView *)_collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoDetailViewController *controller = [MainController getViewController:@"PhotoDetailViewController"];
    controller.asset = list[indexPath.row];
    
    [self.navigationController pushViewController:controller animated:YES];
    [_collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

#pragma mark -
#pragma mark Memory managment

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end