//
//  ArrayViewController.m
//  Test
//
//  Created by Alexander on 26.08.15.
//  Copyright (c) 2015 Alexander Kadyrov. All rights reserved.
//

#import "ArrayViewController.h"

@interface ArrayViewController ()

@end

@implementation ArrayViewController

#pragma mark -
#pragma mark Initializate

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self makeItems];
}

- (void)makeItems {
    list = [[NSMutableArray alloc] init];
    
    tableView.tableHeaderView = viewHeader;
}

#pragma mark -
#pragma mark Actions

- (IBAction)actionGenerateElements {
    
    if (!textFieldCountDigit.text.length) {
        [self showMessageTitle:@"Attention" message:@"Empty field"];
        return;
    }
    
    if ([[textFieldCountDigit.text substringToIndex:1] isEqualToString:@"0"]) {
        [self showMessageTitle:@"Attention" message:@"Wrong data"];
        return;
    }
    
    [list removeAllObjects];
    
    for (NSInteger i = 0; i < textFieldCountDigit.text.integerValue; i++) {
        [list addObject:[NSString stringWithFormat:@"%ld", (long)i]];
    }
    
    NSInteger randomIndex = arc4random() % [list count];
    [list addObject:[list objectAtIndex:randomIndex]];
    
    [tableView reloadData];
    [textFieldCountDigit resignFirstResponder];
}

- (IBAction)actionSearchElement {
    if (!list.count) {
        [self showMessageTitle:@"Attention" message:@"Empty list"];
        return;
    }
    
    NSCountedSet *set = [[NSCountedSet alloc] initWithArray:list];
    
    for (NSNumber *number in set) {
        if ([set countForObject:number] > 1) {
            [self showMessageTitle:@"Duplicate value" message:[NSString stringWithFormat:@"value - %@", number]];
        }
    }
}

#pragma mark -
#pragma mark TableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)_tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)_tableView numberOfRowsInSection:(NSInteger)section {
    return list.count;
}

- (UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifierCell = @"identifierCell";
    
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:identifierCell];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierCell];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.textLabel.text = [list objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark Other

- (void)tableView:(UITableView *)_tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [textFieldCountDigit resignFirstResponder];
}

#pragma mark -
#pragma mark Memory managment

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end