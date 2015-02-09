// 
// ESSAlertAction.h
// ESSBlockDialogs
// 
// Created by Erik Strottmann on 6/28/14.
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

#import <Foundation/Foundation.h>

@interface ESSAlertAction : NSObject

/** The text to use for the action's button's title. */
@property (strong, nonatomic) NSString *title;
/** A block that's executed when the user selects the action. */
@property (copy, nonatomic) void (^block)();

/**
 * Creates and returns a new action with the specified title and handler.
 */
+ (instancetype)actionWithTitle:(NSString *)title
                          block:(void (^)())block;


@end
