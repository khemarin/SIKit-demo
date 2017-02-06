//
//  InputCell.m
//  OSComponent
//
//  Created by Khemarin on 1/30/17.
//  Copyright © 2017 Soteca. All rights reserved.
//

#import "InputCell.h"

@interface InputCell()

@property (assign) BOOL loremData;
@property (assign) SIInputType inputType;

@end

@implementation InputCell

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.loremData = YES;//Should turn to NO to disable test lorem data
    }
    return self;
}

-(void)setFieldInfo:(NSDictionary *)fieldInfo {
    _fieldInfo = fieldInfo;
    _inputType = [self SIInputTypeFromFieldType:[self.fieldInfo[@"fieldType"] intValue]];
    
    if (_inputType == SIInputTypeSegment) {
        [self.input setInputControlFrame:CGRectMake(10, 20, MIN(self.frame.size.width, 190), 20)];
    }
    
    self.input.identifier = fieldInfo[@"dataFieldName"];
    
    [self _setup];
}


- (void)setTheme:(SIFormThemeManager *)theme {
    [super setTheme:theme];
    [self _updateRequiredLevelColor];
}

#pragma mark - Private
- (void) _setup {
    if (self.loremData) {
        [self _setLoremData];
    }
    
    self.input.inputType = _inputType;
    if (_inputType == SIInputTypeOptions || _inputType == SIInputTypeSegment) {
        [self _setOptions];
    }
    else if (_inputType == SIInputTypeList) {
        //show info
        UIButton *infoBtn = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        infoBtn.tintColor = self.theme.actionColor;
        self.input.accessoryButton = infoBtn;
    }
    
    [self _updateRequiredLevelColor];
}

- (void) _updateRequiredLevelColor {
    NSString *requireLevel = self.fieldInfo[@"requiredLevel"];
    NSDictionary *fieldInfo = self.fieldInfo[@"fieldInfos"];
    BOOL mandatory = [requireLevel isEqualToString:@"ApplicationRequired"] || [requireLevel isEqualToString:@"SystemRequired"];
    BOOL recommend = [requireLevel isEqualToString:@"Recommended"];
    BOOL readOnly  = [[fieldInfo valueForKey:@"validForUpdate"] isEqualToString:@"false"] || [[fieldInfo valueForKey:@"validForCreate"] isEqualToString:@"false"];
    
    self.input.readOnly = readOnly;
    self.input.requiredLevelColor = [((FormTheme*)self.theme) getRequiredLevelColorIfMandatory:mandatory andReadOnly:readOnly andRecommend:recommend];
}

- (SIInputType) SIInputTypeFromFieldType:(FieldType) type {
    switch (type) {
        case StdFieldType:
            return SIInputTypeText;
        case PickListFieldType:
            return SIInputTypeOptions;
        case DateOnlyFieldType:
        case DateAndTimeFieldType:
            return SIInputTypeDate;
        case EmailFieldType:
            return SIInputTypeEmail;
        case BooleanFieldType:
            return SIInputTypeSegment;
        case FkFieldType:
            return SIInputTypeList;
        default:
            break;
    }
    return SIInputTypeText;
}

- (void) _setOptions {
    NSDictionary *picklist = self.fieldInfo[@"pickList"];
    NSMutableArray *options = [NSMutableArray array];
    for (NSString *key in [picklist allKeys]) {
        [options addObject:@{
                             @"title" : picklist[key],
                             @"value" : key
                             }];
    }
    
    self.input.options = options;
}

- (void) _setLoremData {
    NSString *valueString = @"";
    switch (self.inputType) {
        case SIInputTypeURL:
            valueString = [[LoremIpsum URL] absoluteString];
            break;
        case SIInputTypeDate:
        case SIInputTypeTime:
        case SIInputTypeDateAndTime:
            valueString = [((AppDelegate*)[[UIApplication sharedApplication] delegate]).dateFormatter stringFromDate:[LoremIpsum date]];
            break;
        case SIInputTypeEmail:
            valueString = [LoremIpsum email];
            break;
        case SIInputTypePhone:
            valueString = @"020-319942";
            break;
        case SIInputTypeText:
            valueString = [LoremIpsum word];
            break;
        default:
            valueString = @"";
            break;
    }
    self.input.inputValue = valueString;
}

@end
