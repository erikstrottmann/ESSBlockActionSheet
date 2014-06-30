//
//  ESSBlockAlertView.h
//  ESSBlockActionSheet
//
//  Created by Erik Strottmann on 6/29/14.
//  Copyright (c) 2014 Erik Strottmann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESSButtonItem.h"

@interface ESSBlockAlertView : UIAlertView <UIAlertViewDelegate>

/**
 * Initializes the alert view with an NSArray of other button items, as well as
 * the other specified parameters.
 */
- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
             cancelButtonItem:(ESSButtonItem *)cancelButtonItem
             otherButtonItems:(NSArray *)otherButtonItems;
/**
 * Initializes the alert view with a nil-terminated list of other button items,
 * as well as the other specified parameters.
 */
- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
             cancelButtonItem:(ESSButtonItem *)cancelButtonItem
          otherButtonItemList:(ESSButtonItem *)firstOtherButtonItem, ... NS_REQUIRES_NIL_TERMINATION;

- (void)addButtonWithItem:(ESSButtonItem *)item;
- (void)addCancelButtonWithItem:(ESSButtonItem *)item;

/**
 * Dismiss the alert view, calling the button item's block if the alert view
 * contains the button item.
 */
- (void)dismissWithClickedButtonItem:(ESSButtonItem *)buttonItem animated:(BOOL)animated;

@end
