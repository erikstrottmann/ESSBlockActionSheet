//
//  ESSBlockAlertView.m
//  ESSBlockActionSheet
//
//  Created by Erik Strottmann on 6/29/14.
//  Copyright (c) 2014 Erik Strottmann. All rights reserved.
//

#import "ESSBlockAlertView.h"

@interface ESSBlockAlertView ()

@property (nonatomic) NSMutableArray *buttonActionItems;

@end


@implementation ESSBlockAlertView

#pragma mark - Initialization

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
             cancelButtonItem:(ESSBlockActionItem *)cancelButtonItem
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
        
        for (ESSBlockActionItem *otherButtonItem in otherButtonItems) {
            [self addButtonWithItem:otherButtonItem];
        }
        
    }
    
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
             cancelButtonItem:(ESSBlockActionItem *)cancelButtonItem
          otherButtonItemList:(ESSBlockActionItem *)firstOtherButtonItem, ...
{
    NSMutableArray *otherButtonItemArray = [NSMutableArray array];
    
    va_list otherButtonItemList;
    va_start(otherButtonItemList, firstOtherButtonItem);
    for (ESSBlockActionItem *otherButtonItem = firstOtherButtonItem;
         otherButtonItem != nil;
         otherButtonItem = va_arg(otherButtonItemList, ESSBlockActionItem *)) {
        
        [otherButtonItemArray addObject:otherButtonItem];
    }
    va_end(otherButtonItemList);
    
    return [self initWithTitle:title
                       message:message
              cancelButtonItem:cancelButtonItem
              otherButtonItems:otherButtonItemArray];
}

#pragma mark - Adding button items

- (void)addButtonWithItem:(ESSBlockActionItem *)item
{
    [self.buttonActionItems addObject:item];
    [self addButtonWithTitle:item.title];
}

- (void)addCancelButtonWithItem:(ESSBlockActionItem *)item
{
    [self addButtonWithItem:item];
    self.cancelButtonIndex = self.buttonActionItems.count - 1;
}

#pragma mark - Dismissing the alert view

- (void)dismissWithClickedButtonItem:(ESSBlockActionItem *)buttonItem animated:(BOOL)animated
{
    if ([self.buttonActionItems containsObject:buttonItem]) {
        [self dismissWithClickedButtonIndex:[self.buttonActionItems indexOfObject:buttonItem] animated:animated];
    }
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex >= 0 && buttonIndex < self.buttonActionItems.count) {
        ESSBlockActionItem *buttonActionItem = self.buttonActionItems[buttonIndex];
        if (buttonActionItem.block) {
            buttonActionItem.block();
        }
    }
}

@end
