// 
// ESSBlockActionSheet.h
// ESSBlockActionSheet
// 
// Created by Erik Strottmann on 6/27/14.
// 
// Copyright (c) 2014 Erik Strottmann
// Licensed under the MIT License:
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

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
