//
//  BitViewController.m
//  Test
//
//  Created by Alexander on 25.08.15.
//  Copyright (c) 2015 Alexander Kadyrov. All rights reserved.
//

#import "BitViewController.h"

@interface BitViewController ()

@end

@implementation BitViewController

#pragma mark -
#pragma mark Initializate

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark -
#pragma mark Int Function

- (NSInteger)intCountZeroBits:(NSString *)string {
    NSMutableArray *listZeroBits = [[NSMutableArray alloc] init];
    
    const char *cstr = [string UTF8String];
    
    size_t length = strlen(cstr);
    
    for (size_t i = 0; i < length; i++) {
        
        uint8_t c = cstr[i];
        
        for (NSInteger j = 0; j < 8; j++) {
            
            if (!(c & 0x80)) {
                [listZeroBits addObject:@"0"];
            }
            
            c <<= 1;
        }
    }
    
    return listZeroBits.count;
}

#pragma mark -
#pragma mark Actions

- (IBAction)actionReturnCountZeroBits {
    if (textFieldString.text.length) {
        [self showMessageTitle:@"Count zero bits" message:[NSString stringWithFormat:@"count - %ld", (long)[self intCountZeroBits:textFieldString.text]]];
    } else {
        [self showMessageTitle:@"Attention" message:@"Empty field"];
    }
}

#pragma mark -
#pragma mark Memory managment

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end