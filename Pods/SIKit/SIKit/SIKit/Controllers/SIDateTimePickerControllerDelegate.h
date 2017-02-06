//
//  SIDateTimePickerControllerDelegate.h
//  SIKit
//
//  Created by Khemarin on 5/18/16.
//  Copyright © 2016 Soteca. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SIDateTimePickerController;

@protocol SIDateTimePickerControllerDelegate

@required
- (void) SIDateTimePickerControllerDonePicking:(SIDateTimePickerController*)sender withDate:(NSDate*)date andCountdownDuration:(NSTimeInterval)duration;
- (void) SIDateTimePickerControllerDidCancel:(SIDateTimePickerController *)sender;

@end
