//
//  PhotoDetailViewController.h
//  Test
//
//  Created by Alexander on 24.08.15.
//  Copyright (c) 2015 Alexander Kadyrov. All rights reserved.
//

#import "ViewController.h"

@interface PhotoDetailViewController : ViewController {
    IBOutlet UIImageView *imageViewPhoto;
    IBOutlet UIButton *buttonSepia;
}

@property (nonatomic, strong) ALAsset *asset;

@end
