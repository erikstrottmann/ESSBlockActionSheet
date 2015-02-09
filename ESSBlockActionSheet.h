// 
// ESSBlockActionSheet.h
// ESSBlockDialogs
// 
// Created by Erik Strottmann on 6/27/14.
// 
// Copyright (c) 2014-2015 Erik Strottmann
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
#import "ESSAlertAction.h"

@interface ESSBlockActionSheet : UIActionSheet <UIActionSheetDelegate>

#pragma mark - Creating an action sheet

/**
 * Creates and returns a new action sheet with a title and no actions.
 */
+ (instancetype)actionSheetWithTitle:(NSString *)title;

#pragma mark - Adding actions

/**
 * Adds an action with the default style.
 */
- (void)addAction:(ESSAlertAction *)action;
/**
 * Adds an action with a style that indicates the action cancels the operation
 * and leaves things unchanged. An action sheet can only have one cancel item,
 * so only the last cancel item added will be in the cancel style.
 */
- (void)addCancelAction:(ESSAlertAction *)action;
/**
 * Adds an action with a style that indicates the action might change or delete
 * data. An action sheet can only have one destructive item, so only the last
 * destructive item added will be in the destructive style.
 */
- (void)addDestructiveAction:(ESSAlertAction *)action;

@end
