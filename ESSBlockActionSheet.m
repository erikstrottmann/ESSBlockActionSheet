//
//  ESSBlockActionSheet.m
//  ESSBlockActionSheet
//
//  Created by Erik Strottmann on 6/27/14.
//  Copyright (c) 2014 Gr8Privacy. All rights reserved.
//

#import "ESSBlockActionSheet.h"

@interface ESSBlockActionSheet ()

@property (nonatomic) NSMutableArray *buttonActionItems;

@end


@implementation ESSBlockActionSheet

#pragma mark - Initialization

- (instancetype)initWithTitle:(NSString *)title
             cancelButtonItem:(ESSButtonItem *)cancelButtonItem
        destructiveButtonItem:(ESSButtonItem *)destructiveButtonItem
             otherButtonItems:(NSArray *)otherButtonItems
{
    self = [super initWithTitle:title
                       delegate:self
              cancelButtonTitle:nil
         destructiveButtonTitle:nil
              otherButtonTitles:nil];
    
    if (self) {
        self.buttonActionItems = [NSMutableArray array];
        
        self.buttonActionItems = [NSMutableArray array];
        
        if (destructiveButtonItem) {
            [self addDestructiveButtonWithItem:destructiveButtonItem];
        }
        
        for (ESSButtonItem *otherButtonItem in otherButtonItems) {
            [self addButtonWithItem:otherButtonItem];
        }
        
        if (cancelButtonItem) {
            [self addCancelButtonWithItem:cancelButtonItem];
        }
    }
    
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
             cancelButtonItem:(ESSButtonItem *)cancelButtonItem
        destructiveButtonItem:(ESSButtonItem *)destructiveButtonItem
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
              cancelButtonItem:cancelButtonItem
         destructiveButtonItem:destructiveButtonItem
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
    self.cancelButtonIndex = self.numberOfButtons - 1;
}

- (void)addDestructiveButtonWithItem:(ESSButtonItem *)item
{
    [self addButtonWithItem:item];
    self.destructiveButtonIndex = self.numberOfButtons - 1;
}

#pragma mark - Dismissing the action sheet

- (void)dismissWithClickedButtonItem:(ESSButtonItem *)buttonItem animated:(BOOL)animated
{
    if ([self.buttonActionItems containsObject:buttonItem]) {
        [self dismissWithClickedButtonIndex:[self.buttonActionItems indexOfObject:buttonItem] animated:animated];
    }
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex >= 0 && buttonIndex < self.buttonActionItems.count) {
        ESSButtonItem *buttonActionItem = self.buttonActionItems[buttonIndex];
        if (buttonActionItem.block) {
            buttonActionItem.block();
        }
    }
}

@end
