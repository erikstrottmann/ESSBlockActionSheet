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
        
        for (ESSBlockActionItem *otherButtonItem in otherButtonItems) {
            [self addButtonWithItem:otherButtonItem];
        }
        
        if (cancelButtonItem) {
            [self addCancelButtonWithItem:cancelButtonItem];
        }
    }
    
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
             cancelButtonItem:(ESSBlockActionItem *)cancelButtonItem
        destructiveButtonItem:(ESSBlockActionItem *)destructiveButtonItem
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
              cancelButtonItem:cancelButtonItem
         destructiveButtonItem:destructiveButtonItem
              otherButtonItems:otherButtonItemArray];
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
