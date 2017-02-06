//
//  SIInputCell.m
//  SIKit
//
//  Created by Khemarin on 1/26/17.
//  Copyright © 2017 Soteca. All rights reserved.
//

#import "SIInputCell.h"

@interface SIInputCell()

@property (nonatomic, strong) NSLayoutConstraint *trailing;
@property (nonatomic, strong) NSLayoutConstraint *leading;
@property (nonatomic, strong) NSLayoutConstraint *top;
@property (nonatomic, strong) NSLayoutConstraint *bottom;

@end

@implementation SIInputCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _setupInput];
    }
    return self;
}

- (void) _setupInput {
    self.input = [[SIInput alloc] init];
    self.input.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.input];
    
    [self.input setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self setupConstraints];
}

- (void) setupConstraints {
    self.top = [self.input.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:self.padding];
    self.leading = [self.input.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:self.padding];
    self.trailing = [self.input.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:(-1 * self.padding)];
    self.bottom = [self.input.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:(-1 * self.padding)];
    
    self.top.active      = YES;
    self.leading.active  = YES;
    self.trailing.active = YES;
    self.bottom.active   = YES;
}

-(void)updateConstraints {
    //Disable
    self.top.active      = NO;
    self.leading.active  = NO;
    self.trailing.active = NO;
    self.bottom.active   = NO;
    
    self.top.constant      = self.padding;
    self.leading.constant  = self.padding;
    self.trailing.constant = -1 * self.padding;
    self.bottom.constant   = -1 * self.padding;
    
    self.top.active      = YES;
    self.leading.active  = YES;
    self.trailing.active = YES;
    self.bottom.active   = YES;
    
    [super updateConstraints];
    [self.input setNeedsDisplay];
}

-(void)setPadding:(float)padding {
    _padding = padding;
    
    [self setNeedsUpdateConstraints];
}


-(void)setTheme:(SIFormThemeManager *)theme {
    _theme = theme;
    
    self.input.requiredLevelColor   = theme.requiredIndicatorColor;
    self.input.titleLabel.font      = theme.font;
    self.input.titleLabel.textColor = theme.displayColor;
    self.input.actionColor          = theme.actionColor;
}

@end
