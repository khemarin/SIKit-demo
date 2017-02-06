//
//  FormTheme.m
//  OSComponent
//
//  Created by Khemarin on 1/30/17.
//  Copyright © 2017 Soteca. All rights reserved.
//

#import "FormTheme.h"

@implementation FormTheme

+ (FormTheme *) globalTheme {
    static FormTheme *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        
        sharedInstance.readOnlyBarColor = [UIColor clearColor];
        sharedInstance.mandatoryBarColor = [UIColor redColor];
        sharedInstance.recommendedBarColor = [UIColor blueColor];
        sharedInstance.defaultBarColor = [UIColor grayColor];
        
        sharedInstance.actionColor = [UIColor colorWithRed:0.20 green:0.60 blue:0.86 alpha:1.0];
    });
    return sharedInstance;
}

-(UIColor *)getRequiredLevelColorIfMandatory:(BOOL)mandatory andReadOnly:(BOOL)readOnly andRecommend:(BOOL)recommend {
    if (readOnly) {
        return self.readOnlyBarColor;
    }
    else if (mandatory) {
        return self.mandatoryBarColor;
    }
    else if (recommend) {
        return self.recommendedBarColor;
    }
    else {
        return self.defaultBarColor;
    }
}

@end
