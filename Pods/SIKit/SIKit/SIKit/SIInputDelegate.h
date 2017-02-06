//
//  SIInputDelegate.h
//  SIKit
//
//  Created by Khemarin on 5/11/16.
//  Copyright © 2016 Soteca. All rights reserved.
//

#ifndef SIInputDelegate_h
#define SIInputDelegate_h

@class SIInput;
@class SIListController;

@protocol SIInputDelegate <NSObject>

@optional
/**
 *  Take the behavior of textField delegate
 *
 *  @param input  SIInput
 *  @param range
 *  @param string
 *
 *  @return BOOL
 */
-(BOOL) SIInput:(SIInput *)input shouldUpdateCharactersInRange:(NSRange)range replacementString:(NSString*)string;

/**
 *  Trigger when SIInput will begin editing
 *
 *  @param input SIInput
 */
-(void) SIInputDidBeginEditing:(SIInput *)input;

-(void) SIInputDidEndEditing:(SIInput *)input;

-(BOOL) SIInputShouldReturn:(SIInput *)input;

-(void) SIInput:(SIInput *)input OptionDidChange:(NSDictionary*)option;

- (void) SIInputAccessoryButtonTouch:(SIInput*)input;


@end


@protocol SIInputDataSource <NSObject>

-(SIListController*) presentingViewControllerForInput:(SIInput *)input;

@end

#endif /* SIInputDelegate_h */
