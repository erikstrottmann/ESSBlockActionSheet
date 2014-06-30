// 
// ESSBlockAlertView.m
// ESSBlockActionSheet
// 
// Created by Erik Strottmann on 6/29/14.
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

#import "ESSBlockAlertView.h"

@interface ESSBlockAlertView ()

@property (nonatomic) NSMutableArray *buttonActionItems;

@end


@implementation ESSBlockAlertView

#pragma mark - Initialization

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
             cancelButtonItem:(ESSButtonItem *)cancelButtonItem
             otherButtonItems:(NSArray *)otherButtonItems
{
    self = [super initWithTitle:title
                        message:message
                       delegate:self
              cancelButtonTitle:nil
              otherButtonTitles:nil];
    
    if (self) {
        self.buttonActionItems = [NSMutableArray array];
        
        self.buttonActionItems = [NSMutableArray array];
        
        if (cancelButtonItem) {
            [self addCancelButtonWithItem:cancelButtonItem];
        }
        
        for (ESSButtonItem *otherButtonItem in otherButtonItems) {
            [self addButtonWithItem:otherButtonItem];
        }
        
    }
    
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
             cancelButtonItem:(ESSButtonItem *)cancelButtonItem
          otherButtonItemList:(ESSButtonItem *)firstOtherButtonItem, ...
{
    NSMutableArray *otherButtonItemArray = [NSMutableArray array];
    
    va_list otherButtonItemList;
    va_start(otherButtonItemList, firstOtherButtonItem);
    for (ESSButtonItem *otherButtonItem = firstOtherButtonItem;
         otherButtonItem != nil;
         otherButtonItem = va_arg(otherButtonItemList, ESSButtonItem *)) {
        
        [otherButtonItemArray addObject:otherButtonItem];
    }
    va_end(otherButtonItemList);
    
    return [self initWithTitle:title
                       message:message
              cancelButtonItem:cancelButtonItem
              otherButtonItems:otherButtonItemArray];
}

#pragma mark - Adding button items

- (void)addButtonWithItem:(ESSButtonItem *)item
{
    [self.buttonActionItems addObject:item];
    [self addButtonWithTitle:item.title];
}

- (void)addCancelButtonWithItem:(ESSButtonItem *)item
{
    [self addButtonWithItem:item];
    self.cancelButtonIndex = self.buttonActionItems.count - 1;
}

#pragma mark - Dismissing the alert view

- (void)dismissWithClickedButtonItem:(ESSButtonItem *)buttonItem animated:(BOOL)animated
{
    if ([self.buttonActionItems containsObject:buttonItem]) {
        [self dismissWithClickedButtonIndex:[self.buttonActionItems indexOfObject:buttonItem] animated:animated];
    }
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex >= 0 && buttonIndex < self.buttonActionItems.count) {
        ESSButtonItem *buttonActionItem = self.buttonActionItems[buttonIndex];
        if (buttonActionItem.block) {
            buttonActionItem.block();
        }
    }
}

@end
