//
//  ESSBlockActionItem.m
//  ESSBlockActionSheet
//
//  Created by Erik Strottmann on 6/28/14.
//  Copyright (c) 2014 Erik Strottmann. All rights reserved.
//

#import "ESSBlockActionItem.h"

@implementation ESSBlockActionItem

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

@end
