// 
// ESSBlockAlertView.m
// ESSBlockDialogs
// 
// Created by Erik Strottmann on 6/29/14.
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

#import "ESSBlockAlertView.h"

@interface ESSBlockAlertView ()

@property (nonatomic) NSMutableArray *actions;

@end


@implementation ESSBlockAlertView

#pragma mark - Creating an alert view

+ (instancetype)alertViewWithTitle:(NSString *)title
                           message:(NSString *)message
{
    ESSBlockAlertView *alertView = [[self alloc] init];
    
    alertView.title = title;
    alertView.message = message;
    alertView.actions = [NSMutableArray array];
    
    return alertView;
}

- (instancetype)init
{
    self = [super initWithTitle:nil
                        message:nil
                       delegate:self
              cancelButtonTitle:nil
              otherButtonTitles:nil];
    
    return self;
}

#pragma mark - Adding actions

- (void)addAction:(ESSAlertAction *)item
{
    [self.actions addObject:item];
    [self addButtonWithTitle:item.title];
}

- (void)addCancelAction:(ESSAlertAction *)item
{
    [self addAction:item];
    self.cancelButtonIndex = self.actions.count - 1;
}

#pragma mark - Handling button taps

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex >= 0 && buttonIndex < self.actions.count) {
        ESSAlertAction *action = self.actions[buttonIndex];
        if (action.block) {
            action.block();
        }
    }
}

@end
