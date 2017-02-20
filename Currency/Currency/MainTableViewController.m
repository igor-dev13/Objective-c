
//  MainTableViewController.m
//  Currency
//
//  Created by Admin on 07.02.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "MainTableViewController.h"
#import "DetailViewController.h"
#import "MyTableVIewCell.h"

@interface MainTableViewController ()

@property (nonnull, nonatomic, strong) NSMutableArray * arrayEvents;

@end

@implementation MainTableViewController

- (void)setPageValue: (DetailViewController *) sender;{
    sender.textLabel.text = self.currentText;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:NSStringFromClass([MyTableViewCell class])];
    
    self.arrayEvents = [[NSMutableArray alloc] init];
    
    for (int i=0; i < 10; i++)
    {
        [self.arrayEvents addObject:[NSString stringWithFormat:@"%d",i]];
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayEvents.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MyTableViewCell class]) forIndexPath:indexPath];
    NSString * content = [self.arrayEvents objectAtIndex:indexPath.row];
    cell.textLabel.text = content;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DetailViewController * detailView = [[DetailViewController alloc] init];
    self.currentText = [self.arrayEvents objectAtIndex:indexPath.row];
    detailView.delegate = self;
    
    [self.navigationController pushViewController:detailView animated:YES];
}

@end
