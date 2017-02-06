//
//  SIListControllerDelegate.h
//  SIKit
//
//  Created by Khemarin on 5/19/16.
//  Copyright © 2016 Soteca. All rights reserved.
//

#ifndef SIListControllerDelegate_h
#define SIListControllerDelegate_h

#import <Foundation/Foundation.h>

@class SIInput;
@class SIListController;

@protocol SIListControllerDelegate <NSObject>

@optional
-(void) listController:(SIListController*)controller didSelectRowAtIndexPath:(NSIndexPath*)indexPath;
-(void) listController:(SIListController*)controller didSelectItem:(id)item;
-(UITableViewCell *)listController:(SIListController*)controller cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

#endif /* SIListControllerDelegate_h */
