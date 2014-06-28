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

- (instancetype)initWithTitle:(NSString *)title
             cancelButtonItem:(ESSBlockActionItem *)cancelButtonItem
        destructiveButtonItem:(ESSBlockActionItem *)destructiveButtonItem
             otherButtonItems:(ESSBlockActionItem *)otherButtonItems, ...;

- (void)addButtonWithItem:(ESSBlockActionItem *)item;
- (void)addCancelButtonWithItem:(ESSBlockActionItem *)item;
- (void)addDestructiveButtonWithItem:(ESSBlockActionItem *)item;

@end
