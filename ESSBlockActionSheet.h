//
//  ESSBlockActionSheet.h
//  ESSBlockActionSheet
//
//  Created by Erik Strottmann on 6/27/14.
//  Copyright (c) 2014 Gr8Privacy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESSBlockActionItem.h"

@interface ESSBlockActionSheet : UIActionSheet <UIActionSheetDelegate>

/**
 * Initializes the action sheet with an NSArray of other button items, as well
 * as the other specified parameters.
 */
- (instancetype)initWithTitle:(NSString *)title
             cancelButtonItem:(ESSBlockActionItem *)cancelButtonItem
        destructiveButtonItem:(ESSBlockActionItem *)destructiveButtonItem
             otherButtonItems:(NSArray *)otherButtonItems;
/**
 * Initializes the action sheet with a nil-terminated list of other button
 * items, as well as the other specified parameters.

 */
- (instancetype)initWithTitle:(NSString *)title
             cancelButtonItem:(ESSBlockActionItem *)cancelButtonItem
        destructiveButtonItem:(ESSBlockActionItem *)destructiveButtonItem
             otherButtonItemList:(ESSBlockActionItem *)firstOtherButtonItem, ... NS_REQUIRES_NIL_TERMINATION;

- (void)addButtonWithItem:(ESSBlockActionItem *)item;
- (void)addCancelButtonWithItem:(ESSBlockActionItem *)item;
- (void)addDestructiveButtonWithItem:(ESSBlockActionItem *)item;

/**
 * Dismiss the action sheet, calling the button item's block if the action sheet
 * contains the button item.
 */
- (void)dismissWithClickedButtonItem:(ESSBlockActionItem *)buttonItem animated:(BOOL)animated;

@end
