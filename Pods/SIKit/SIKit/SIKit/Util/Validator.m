//
//  Validator.m
//  SIKit
//
//  Created by Khemarin on 5/16/16.
//  Copyright © 2016 Soteca. All rights reserved.
//

#import "Validator.h"

@implementation Validator

+(BOOL)isIntegerByAppendingString:(NSString *)appendString toString:(NSString *)text {
    NSCharacterSet * digit = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet *inStringSet = [NSCharacterSet characterSetWithCharactersInString:appendString];
    return [digit isSupersetOfSet:inStringSet];
}

+(BOOL)isFloatByAppendingString:(NSString *)appendString toString:(NSString *)text {
    //final string if appended
    NSString *resultingString = [text stringByAppendingString:appendString];
    
    //localized decimal point separator
    NSString * decimalSeparator = [[NSLocale currentLocale] objectForKey:NSLocaleDecimalSeparator];
    
    NSUInteger numberOfDots = [resultingString length] - [[resultingString stringByReplacingOccurrencesOfString:decimalSeparator withString:@""] length];
    BOOL isValidDot = [appendString isEqualToString:decimalSeparator] && (numberOfDots < 2);
    
    return [Validator isIntegerByAppendingString:appendString toString:text] || isValidDot;
}


@end
