//
//  SIDateTimePickerController.m
//  SIKit
//
//  Created by Khemarin on 5/18/16.
//  Copyright © 2016 Soteca. All rights reserved.
//

#import "SIDateTimePickerController.h"

@interface SIDateTimePickerController()

@property (strong, nonatomic) UIButton * doneButton;
@property (strong, nonatomic) UIButton * cancelButton;

@end

@implementation SIDateTimePickerController

- (instancetype)init
{
    self = [super init];
    if (self) {
        CGRect frame = CGRectMake(0, 0,300, 270);
        
        //date picker
        self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - 50)];
        
        CGSize buttonSize = CGSizeMake(100, 30);
        
        //Done button
        self.doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.doneButton setFrame:CGRectMake(frame.size.width - buttonSize.width - 10, frame.size.height - buttonSize.height - 10, buttonSize.width, buttonSize.height)];
        [self.doneButton setTitle:NSLocalizedString(@"Done", @"Done") forState:UIControlStateNormal];
        [self.doneButton addTarget:self action:@selector(doneButtonTap:) forControlEvents:UIControlEventTouchUpInside];
        
        //Cancel button
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.cancelButton setFrame:CGRectMake(10, frame.size.height - buttonSize.height - 10, buttonSize.width, buttonSize.height)];
        [self.cancelButton setTitle:NSLocalizedString(@"Cancel", @"Cancel") forState:UIControlStateNormal];
        [self.cancelButton addTarget:self action:@selector(cancelButtonTap:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:self.datePicker];
        [self.view addSubview:self.doneButton];
        [self.view addSubview:self.cancelButton];
    }
    return self;
}

-(CGSize)preferredContentSize {
    return CGSizeMake(300, 270);
}

#pragma mark - Event

- (void) doneButtonTap:(UIButton*)sender {
    [self.delegate SIDateTimePickerControllerDonePicking:self withDate:self.datePicker.date andCountdownDuration:self.datePicker.countDownDuration];
}

- (void) cancelButtonTap:(UIButton*)sender {
    [self.delegate SIDateTimePickerControllerDidCancel:self];
}

@end
