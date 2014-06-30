//
//  ESSBlockActionSheet.h
//  ESSBlockActionSheet
//
//  Created by Erik Strottmann on 6/27/14.
//  Copyright (c) 2014 Gr8Privacy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESSButtonItem.h"

@interface ESSBlockActionSheet : UIActionSheet <UIActionSheetDelegate>

/**
 * Initializes the action sheet with an NSArray of other button items, as well
 * as the other specified parameters.
 */
- (instancetype)initWithTitle:(NSString *)title
             cancelButtonItem:(ESSButtonItem *)cancelButtonItem
        destructiveButtonItem:(ESSButtonItem *)destructiveButtonItem
             otherButtonItems:(NSArray *)otherButtonItems;
/**
 * Initializes the action sheet with a nil-terminated list of other button
 * items, as well as the other specified parameters.

 */
- (instancetype)initWithTitle:(NSString *)title
             cancelButtonItem:(ESSButtonItem *)cancelButtonItem
        destructiveButtonItem:(ESSButtonItem *)destructiveButtonItem
             otherButtonItemList:(ESSButtonItem *)firstOtherButtonItem, ... NS_REQUIRES_NIL_TERMINATION;

- (void)addButtonWithItem:(ESSButtonItem *)item;
- (void)addCancelButtonWithItem:(ESSButtonItem *)item;
- (void)addDestructiveButtonWithItem:(ESSButtonItem *)item;

/**
 * Dismiss the action sheet, calling the button item's block if the action sheet
 * contains the button item.
 */
- (void)dismissWithClickedButtonItem:(ESSButtonItem *)buttonItem animated:(BOOL)animated;

@end
