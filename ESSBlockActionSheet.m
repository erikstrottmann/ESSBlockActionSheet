//
//  ESSBlockActionSheet.m
//
//  Created by Erik Strottmann on 6/27/14.
//  Copyright (c) 2014 Gr8Privacy. All rights reserved.
//

#import "ESSBlockActionSheet.h"

@interface ESSBlockActionSheet ()
{
    void (^_cancelButtonBlock)();
    void (^_destructiveButonBlock)();
}

@property (nonatomic, copy) void (^cancelButtonBlock)();
@property (nonatomic, copy) void (^destructiveButtonBlock)();
@property (nonatomic) NSArray *otherButtonBlocks;

@end


@implementation ESSBlockActionSheet

- (instancetype)initWithTitle:(NSString *)title
            cancelButtonTitle:(NSString *)cancelButtonTitle
            cancelButtonBlock:(void (^)())cancelButtonBlock
       destructiveButtonTitle:(NSString *)destructiveButtonTitle
       destructiveButtonBlock:(void (^)())destructiveButtonBlock
            otherButtonTitles:(NSArray *)otherButtonTitles
            otherButtonBlocks:(NSArray *)otherButtonBlocks
{
    // Start off by initializing cancel and destructive buttons
    self = [super initWithTitle:title delegate:self cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:destructiveButtonTitle otherButtonTitles:nil];
    if (self) {
        self.cancelButtonBlock = cancelButtonBlock;
        self.destructiveButtonBlock = destructiveButtonBlock;
        self.otherButtonBlocks = otherButtonBlocks;
        
        // Now initialize other buttons
        for (NSString *title in otherButtonTitles) {
            [self addButtonWithTitle:title];
        }
    }
    return self;
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == self.cancelButtonIndex) {
        self.cancelButtonBlock();
        
    } else if (buttonIndex == self.destructiveButtonIndex) {
        self.destructiveButtonBlock();
        
    } else {
        // Since the array only stores otherButtonBlocks, we need to adjust for
        // cancel and destructive buttons, if present
        NSInteger adjustedButtonIndex = buttonIndex;
        if (self.cancelButtonIndex != -1 && self.cancelButtonIndex < buttonIndex) {
            adjustedButtonIndex--;
        }
        if (self.destructiveButtonIndex != -1 && self.destructiveButtonIndex < buttonIndex) {
            adjustedButtonIndex--;
        }
        
        void (^otherButtonBlock)() = self.otherButtonBlocks[adjustedButtonIndex];
        otherButtonBlock();
    }
}

@end
