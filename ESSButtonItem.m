//
//  ESSButtonItem.m
//  ESSBlockActionSheet
//
//  Created by Erik Strottmann on 6/28/14.
//  Copyright (c) 2014 Erik Strottmann. All rights reserved.
//

#import "ESSButtonItem.h"

@implementation ESSButtonItem

#pragma mark - Initialization

- (instancetype)initWithTitle:(NSString *)title block:(void (^)())block
{
    self = [super init];
    if (self) {
        self.title = title;
        self.block = block;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
{
    return [self initWithTitle:title block:nil];
}

#pragma mark - Factory methods

+ (instancetype)itemWithTitle:(NSString *)title block:(void (^)())block
{
    return [[self alloc] initWithTitle:title block:block];
}

+ (instancetype)itemWithTitle:(NSString *)title
{
    return [self itemWithTitle:title block:nil];
}

@end
