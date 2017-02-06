//
//  SIFormThemeManager.m
//  SIKit
//
//  Created by Khemarin on 5/9/16.
//  Copyright © 2016 Soteca. All rights reserved.
//

#import "SIFormThemeManager.h"

@implementation SIFormThemeManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.actionColor                 = [UIColor redColor];
        self.displayColor                = [UIColor blackColor];
        self.sectionTitleBackgroundColor = [UIColor grayColor];
        self.requiredIndicatorColor      = [UIColor redColor];
        self.blockSeparatorColor         = [UIColor grayColor];
        self.font                        = [UIFont systemFontOfSize:13];
    }
    return self;
}

@end
