//
//  ArrayViewController.h
//  Test
//
//  Created by Alexander on 26.08.15.
//  Copyright (c) 2015 Alexander Kadyrov. All rights reserved.
//

#import "ViewController.h"

@interface ArrayViewController : ViewController {
    IBOutlet UITableView *tableView;
    IBOutlet UIView *viewHeader;
    IBOutlet UITextField *textFieldCountDigit;
    NSMutableArray *list;
}

@end
