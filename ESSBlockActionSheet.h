//
//  ESSBlockActionSheet.h
//
//  Created by Erik Strottmann on 6/27/14.
//  Copyright (c) 2014 Gr8Privacy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ESSBlockActionSheet : UIActionSheet <UIActionSheetDelegate>

/*
 * This action sheet serves as its own delegate. When a button is clicked, its
 * corresponding block is called. otherButtonTitles.count must equal
 * otherButtonBlocks.count. Blocks must not be null, though they can be empty.
 */
- (instancetype)initWithTitle:(NSString *)title
            cancelButtonTitle:(NSString *)cancelButtonTitle
            cancelButtonBlock:(void(^)())cancelButtonBlock
       destructiveButtonTitle:(NSString *)destructiveButtonTitle
       destructiveButtonBlock:(void(^)())destructiveButtonBlock
            otherButtonTitles:(NSArray *)otherButtonTitles
            otherButtonBlocks:(NSArray *)otherButtonBlocks;

@end
