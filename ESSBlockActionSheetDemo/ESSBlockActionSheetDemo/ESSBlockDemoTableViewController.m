// 
// ESSBlockDemoTableViewController.m
// ESSBlockActionSheetDemo
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

#import "ESSBlockDemoTableViewController.h"
#import "ESSBlockActionSheet.h"
#import "ESSBlockAlertView.h"

static NSString * const kCellReuseIdentifier = @"cellReuseIdentifier";

@interface ESSBlockDemoTableViewController ()

@property (nonatomic) NSMutableArray *objects;

@end

@implementation ESSBlockDemoTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.objects = [NSMutableArray array];
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellReuseIdentifier];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *actionButton = [[UIBarButtonItem alloc] initWithTitle:@"Action!"
                                                                     style:UIBarButtonItemStylePlain
                                                                    target:self
                                                                    action:@selector(presentActionSheet)];
    self.navigationItem.leftBarButtonItem = actionButton;
    
    UIBarButtonItem *alertButton = [[UIBarButtonItem alloc] initWithTitle:@"Alert!"
                                                                    style:UIBarButtonItemStylePlain
                                                                   target:self
                                                                   action:@selector(presentAlertView)];
    self.navigationItem.rightBarButtonItem = alertButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Present the action sheet

/*
 * Determine which action sheet we should present to the user, and do so.
 */
- (void)presentActionSheet
{
    if ([UIAlertController class]) {
        [self presentiOS8ActionSheet];
    } else {
        [self presentESSActionSheet];
    }
}

/*
 * This code will be run on iOS 7 and earlier, where UIAlertController is
 * unavailable.
 */
- (void)presentESSActionSheet
{
    // First, create the action sheet:
    ESSBlockActionSheet *actionSheet = [ESSBlockActionSheet actionSheetWithTitle:@"You're on iOS 7 or earlier. Edit the list?"];
    
    // Now, let's create a bunch of actions:
    ESSAlertAction *cancelAction = [ESSAlertAction actionWithTitle:@"Cancel" block:nil];
    ESSAlertAction *destructiveAction = [ESSAlertAction actionWithTitle:@"Delete Everything" block:^
    {
        self.objects = [NSMutableArray array];
        [self.tableView reloadData];
    }];
    ESSAlertAction *foxAction = [ESSAlertAction actionWithTitle:@"Add \"Fox\" Row" block:^
    {
        [self.objects addObject:@"The quick brown fox jumps over the lazy dog."];
        [self.tableView reloadData];
    }];
    ESSAlertAction *sphinxAction = [ESSAlertAction actionWithTitle:@"Add \"Sphinx\" Row" block:^
    {
        [self.objects addObject:@"Sphinx of black quartz, judge my vow!"];
        [self.tableView reloadData];
    }];
    
    // Add the actions to the action sheet:
    [actionSheet addCancelAction:cancelAction];
    [actionSheet addDestructiveAction:destructiveAction];
    [actionSheet addAction:foxAction];
    [actionSheet addAction:sphinxAction];
    
    // Finally, present the action sheet:
    [actionSheet showInView:self.view]; // iPhone
    /*
     [actionSheet showFromRect:self.view.bounds // iPad
     inView:self.view
     animated:YES];
     */
}

/*
 * This code will be run on iOS 8 and later, where UIAlertController is
 * available.
 */
- (void)presentiOS8ActionSheet
{
    // First, create the action sheet:
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"You're on iOS 8 or later. Edit the list?"
                                                                         message:@"On iOS 8, action sheets can have messages."
                                                                  preferredStyle:UIAlertControllerStyleActionSheet];
    
    // Now, let's create a bunch of actions:
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:@"Delete Everything"
                                                                style:UIAlertActionStyleDestructive
                                                              handler:^(UIAlertAction *action)
    {
        self.objects = [NSMutableArray array];
        [self.tableView reloadData];
    }];
    UIAlertAction *foxAction = [UIAlertAction actionWithTitle:@"Add \"Fox\" Row"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action)
    {
        [self.objects addObject:@"The quick brown fox jumps over the lazy dog."];
        [self.tableView reloadData];
    }];
    UIAlertAction *sphinxAction = [UIAlertAction actionWithTitle:@"Add \"Sphinx\" Row"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction *action)
    {
        [self.objects addObject:@"Sphinx of black quartz, judge my vow!"];
        [self.tableView reloadData];
    }];
    
    // Add the actions to the action sheet:
    [actionSheet addAction:cancelAction];
    [actionSheet addAction:destructiveAction];
    [actionSheet addAction:foxAction];
    [actionSheet addAction:sphinxAction];
    
    // Finally, present the action sheet:
    [self presentViewController:actionSheet animated:YES completion:nil];
}

#pragma mark - Present the alert view

/*
 * Determine which alert view we should present to the user, and do so.
 */
- (void)presentAlertView
{
    if ([UIAlertController class]) {
        [self presentiOS8AlertView];
    } else {
        [self presentESSAlertView];
    }
}

/*
 * This code will be run on iOS 7 and earlier, where UIAlertController is
 * unavailable.
 */
- (void)presentESSAlertView
{
    // First, create the action sheet:
    ESSBlockAlertView *alertView = [ESSBlockAlertView alertViewWithTitle:@"You're on iOS 7 or earlier."
                                                                 message:@"The text you enter below will be added to the list."];
    
    // We'll add a text field to this one:
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput; // plain text field
    // alertView.alertViewStyle = UIAlertViewStyleSecureTextInput; // password field
    // alertView.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput; // username and password fields
    
    // Now, let's create a few actions:
    ESSAlertAction *cancelAction = [ESSAlertAction actionWithTitle:@"Cancel" block:nil];
    ESSAlertAction *addAction = [ESSAlertAction actionWithTitle:@"Add" block:^
    {
        // Get the text the user entered:
        UITextField *textField = [alertView textFieldAtIndex:0];
        NSString *text = textField.text;
                                     
        // Add the text to the list:
        [self.objects addObject:text];
        [self.tableView reloadData];
    }];
    
    // Add the actions to the action sheet:
    [alertView addCancelAction:cancelAction];
    [alertView addAction:addAction];
    
    // Finally, present the action sheet:
    [alertView show];
}

/*
 * This code will be run on iOS 8 and later, where UIAlertController is
 * available.
 */
- (void)presentiOS8AlertView
{
    // First, create the action sheet:
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"You're on iOS 8 or later."
                                                                       message:@"The text you enter below will be added to the list. (See the red button? UIAlertAction alert views can have destructive actions.)"
                                                                preferredStyle:UIAlertControllerStyleAlert];
    
    // We'll add a text field to this one:
    [alertView addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        // You can set text field properties here, like:
        // textField.secureTextEntry = YES; // make it a password field
    }];
    
    // Now, let's create a few actions:
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    UIAlertAction *addAction = [UIAlertAction actionWithTitle:@"Add"
                                                        style:UIAlertActionStyleDestructive
                                                      handler:^(UIAlertAction *action)
    {
        // Get the text the user entered:
        UITextField *textField = alertView.textFields[0];
        NSString *text = textField.text;
        
        // Add the text to the list:
        [self.objects addObject:text];
        [self.tableView reloadData];
    }];
    
    // Add the actions to the action sheet:
    [alertView addAction:cancelAction];
    [alertView addAction:addAction];
    
    // Finally, present the action sheet:
    [self presentViewController:alertView animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseIdentifier forIndexPath:indexPath];

    cell.textLabel.text = self.objects[indexPath.row];
    
    return cell;
}

@end
