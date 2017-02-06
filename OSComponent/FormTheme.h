//
//  FormTheme.h
//  OSComponent
//
//  Created by Khemarin on 1/30/17.
//  Copyright © 2017 Soteca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SIKit/SIFormThemeManager.h>

@interface FormTheme : SIFormThemeManager

+ (FormTheme *) globalTheme;

@property (nonatomic, strong) UIColor *mandatoryBarColor;
@property (nonatomic, strong) UIColor *readOnlyBarColor;
@property (nonatomic, strong) UIColor *recommendedBarColor;
@property (nonatomic, strong) UIColor *defaultBarColor;

-(UIColor*)getRequiredLevelColorIfMandatory:(BOOL)mandatory andReadOnly:(BOOL)readOnly andRecommend:(BOOL)recommend;

@end
