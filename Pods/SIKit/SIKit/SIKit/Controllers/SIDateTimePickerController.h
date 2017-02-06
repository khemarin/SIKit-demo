//
//  SIDateTimePickerController.h
//  SIKit
//
//  Created by Khemarin on 5/18/16.
//  Copyright © 2016 Soteca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SIDateTimePickerControllerDelegate.h"

@interface SIDateTimePickerController : UIViewController

@property (strong, nonatomic) UIDatePicker * datePicker;
@property (strong, nonatomic) id<SIDateTimePickerControllerDelegate> delegate;

- (instancetype)init;

@end
