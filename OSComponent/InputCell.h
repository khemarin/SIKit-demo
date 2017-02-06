//
//  InputCell.h
//  OSComponent
//
//  Created by Khemarin on 1/30/17.
//  Copyright © 2017 Soteca. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "FormTheme.h"

#import "LoremIpsum.h"
#import <SIKit/SIInputCell.h>

typedef enum {
    StdFieldType = 0,
    PickListFieldType = 1,
    FkFieldType = 2,
    AggregateFkFieldType = 3,
    PartyListFieldType = 4,
    TextAreaFieldType = 5,
    DateOnlyFieldType = 6,
    DateAndTimeFieldType = 7,
    StateCodeFieldType = 8,
    StatusCodeFieldType = 9,
    AnnotationFieldType = 10,
    UrlFieldType = 11,
    EmailFieldType = 12,
    PhoneFieldType = 13,
    AddressFieldType = 14,
    DurationFieldType = 15,
    ViewFieldType = 20,
    BooleanFieldType = 21,
    Unknown = 100
} FieldType;


@interface InputCell : SIInputCell

@property (nonatomic, strong) NSDictionary *fieldInfo;

@end
