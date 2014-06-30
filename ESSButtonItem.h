//
//  ESSButtonItem.h
//  ESSBlockActionSheet
//
//  Created by Erik Strottmann on 6/28/14.
//  Copyright (c) 2014 Erik Strottmann. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESSButtonItem : NSObject

@property (strong, nonatomic) NSString *title;
@property (copy, nonatomic) void (^block)();

- (instancetype)initWithTitle:(NSString *)title block:(void (^)())block;
- (instancetype)initWithTitle:(NSString *)title;

+ (instancetype)itemWithTitle:(NSString *)title block:(void (^)())block;
+ (instancetype)itemWithTitle:(NSString *)title;

@end
