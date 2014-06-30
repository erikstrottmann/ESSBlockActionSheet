//
//  ESSBlockDemoTableViewController.m
//  ESSBlockActionSheetDemo
//
//  Created by Erik Strottmann on 6/28/14.
//  Copyright (c) 2014 Erik Strottmann. All rights reserved.
//

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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
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

#pragma mark - Action sheet & alert view

- (void)presentActionSheet
{
    NSString *title = @"Do something to this list.";
    ESSButtonItem *cancelButtonItem = [ESSButtonItem itemWithTitle:@"Cancel"];
    ESSButtonItem *destructiveButtonItem = [ESSButtonItem itemWithTitle:@"Delete Everything" block:^{
        self.objects = [NSMutableArray array];
        [self.tableView reloadData];
    }];
    ESSButtonItem *foxButtonItem = [ESSButtonItem itemWithTitle:@"Add \"Fox\" Row" block:^{
        [self.objects addObject:@"The quick brown fox jumps over the lazy dog."];
        [self.tableView reloadData];
    }];
    ESSButtonItem *sphinxButtonItem = [ESSButtonItem itemWithTitle:@"Add \"Sphinx\" Row" block:^{
        [self.objects addObject:@"Sphinx of black quartz, judge my vow!"];
        [self.tableView reloadData];
    }];
    
    ESSBlockActionSheet *actionSheet = [[ESSBlockActionSheet alloc] initWithTitle:title
                                                                 cancelButtonItem:cancelButtonItem
                                                            destructiveButtonItem:destructiveButtonItem
                                                                 otherButtonItems:@[foxButtonItem, sphinxButtonItem]];
    [actionSheet showInView:self.view];
}

- (void)presentAlertView
{
    NSString *title = @"Add \"lorem\" row?";
    NSString *message = @"This will add a line of pseudo-Latin to the list.";
    ESSButtonItem *cancelButtonItem = [ESSButtonItem itemWithTitle:@"Cancel"];
    ESSButtonItem *acceptButtonItem = [ESSButtonItem itemWithTitle:@"Add Row" block:^{
        [self.objects addObject:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit..."];
        [self.tableView reloadData];
    }];
    
    ESSBlockAlertView *alertView = [[ESSBlockAlertView alloc] initWithTitle:title
                                                                    message:message
                                                           cancelButtonItem:cancelButtonItem
                                                           otherButtonItems:@[acceptButtonItem]];
    [alertView show];
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
