//
//  Validator.h
//  SIKit
//
//  Created by Khemarin on 5/16/16.
//  Copyright © 2016 Soteca. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validator : NSObject

/**
 *  Check if after appending a string to a text, the result is still an integer
 *
 *  @param appendString string to append
 *  @param text         destination string
 *
 *  @return BOOL
 */
+ (BOOL) isIntegerByAppendingString:(NSString*)appendString toString:(NSString*)text;

/**
 *  Check if after appending a string to a text, the result is still an float/double
 *
 *  @param appendString string to append
 *  @param text         destination string
 *
 *  @return BOOL
 */
+ (BOOL) isFloatByAppendingString:(NSString *)appendString toString:(NSString *)text;

@end
