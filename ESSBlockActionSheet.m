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

- (instancetype)initWithTitle:(NSString *)title
             cancelButtonItem:(ESSBlockActionItem *)cancelButtonItem
        destructiveButtonItem:(ESSBlockActionItem *)destructiveButtonItem
             otherButtonItems:(ESSBlockActionItem *)firstOtherButtonItem, ...
{
    self = [super initWithTitle:title
                       delegate:self
              cancelButtonTitle:nil
         destructiveButtonTitle:nil
              otherButtonTitles:nil];
    if (self) {
        NSMutableArray *buttonActionItems = [NSMutableArray array];
        
        if (destructiveButtonItem) {
            [self addDestructiveButtonWithItem:destructiveButtonItem];
        }
        
        va_list otherButtonItems;
        va_start(otherButtonItems, firstOtherButtonItem);
        for (ESSBlockActionItem *otherButtonItem = firstOtherButtonItem;
                otherButtonItem != nil;
                otherButtonItem = va_arg(otherButtonItems, ESSBlockActionItem *)) {
            
            [self addButtonWithItem:otherButtonItem];
        }
        va_end(otherButtonItems);
        
        if (cancelButtonItem) {
            [self addCancelButtonWithItem:cancelButtonItem];
        }
        
        self.buttonActionItems = buttonActionItems;
    }
    return self;
}

- (void)addButtonWithItem:(ESSBlockActionItem *)item
{
    [self.buttonActionItems addObject:item];
    [self addButtonWithTitle:item.title];
}

- (void)addCancelButtonWithItem:(ESSBlockActionItem *)item
{
    [self addButtonWithItem:item];
    self.cancelButtonIndex = self.numberOfButtons;
}

- (void)addDestructiveButtonWithItem:(ESSBlockActionItem *)item
{
    [self addButtonWithItem:item];
    self.destructiveButtonIndex = self.numberOfButtons;
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex >= 0 && buttonIndex < self.buttonActionItems.count) {
        ESSBlockActionItem *buttonActionItem = self.buttonActionItems[buttonIndex];
        if (buttonActionItem.block) {
            buttonActionItem.block();
        }
    }
}

@end
