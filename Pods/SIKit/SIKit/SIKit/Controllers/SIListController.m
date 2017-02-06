//
//  SIListController.m
//  SIKit
//
//  Created by Khemarin on 5/19/16.
//  Copyright © 2016 Soteca. All rights reserved.
//

#import "SIListController.h"

@interface SIListController()

@end

@implementation SIListController

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

-(void)refreshTableView {
    [self.tableView reloadData];
}

-(void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - UITableView Delegate & DataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.list count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(listController:cellForRowAtIndexPath:)]) {
        return [self.delegate listController:self cellForRowAtIndexPath:indexPath];
    }
    
    static NSString * cellIdentifier = @"listcell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(listController:didSelectRowAtIndexPath:)]) {
        [self.delegate listController:self didSelectRowAtIndexPath:indexPath];
    }
    if ([self.delegate respondsToSelector:@selector(listController:didSelectItem:)]) {
        [self.delegate listController:self didSelectItem:self.list[indexPath.row]];
    }
}

@end
