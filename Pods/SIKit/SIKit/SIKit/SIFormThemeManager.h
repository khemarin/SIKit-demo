//
//  SIFormThemeManager.h
//  SIKit
//
//  Created by Khemarin on 5/9/16.
//  Copyright © 2016 Soteca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 The SIFormThemeManager manages the properties that provide SIForm and SIFormInput the consistant of font, color and other style.
 */
@interface SIFormThemeManager : NSObject

/**
 *  actionColor is the color normally used in clickable items such as button, switch, etc.
 */
@property (nonatomic, strong) UIColor * actionColor;


/**
 *  displayColor is used for item use for display only such as label, read-only input, etc.
 */
@property (nonatomic, strong) UIColor * displayColor;


/**
 *  fontName provide the consitant font that should be used across the form.
 *  In different hierarchy, the font name is the same but different only in colors/attribute.
 */
@property (nonatomic, strong) UIFont * font;


/**
 *  The background color for section title
 */
@property (nonatomic, strong) UIColor * sectionTitleBackgroundColor;


/**
 *  Color of block separator line.
 */
@property (nonatomic, strong) UIColor * blockSeparatorColor;


/**
 *  The color of the vertical line indicate mandatory of the field.
 */
@property (nonatomic, strong) UIColor * requiredIndicatorColor;

/**
 *  Initialize SIFormThemeManager object
 *
 *  @return SIFormManager
 */
-(instancetype)init;

@end
