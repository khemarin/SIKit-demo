//
//  SIListController.h
//  SIKit
//
//  Created by Khemarin on 5/19/16.
//  Copyright © 2016 Soteca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SIListControllerDelegate.h"

@interface SIListController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UIView *headerView;

@property (strong, nonatomic) id presenter;

@property (strong, nonatomic) NSArray<NSDictionary *> * list;

@property (strong, nonatomic) id<SIListControllerDelegate> delegate;

/**
 Trigger uitableview reloadData.
 */
- (void) refreshTableView;

@end
