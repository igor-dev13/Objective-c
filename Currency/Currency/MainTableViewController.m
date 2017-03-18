
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

- (NSString *)setPageValue: (DetailViewController *) sender;{
    return self.currentText;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
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

- (nullable NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MyTableViewCell class]) forIndexPath:indexPath];
    
    cell.currencyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,cell.frame.size.width,cell.frame.size.height)];
    cell.currencyLabel.text=[self.arrayEvents objectAtIndex:indexPath.row];
    cell.currencyLabel.textAlignment = NSTextAlignmentCenter;
    [cell.contentView addSubview:cell.currencyLabel];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DetailViewController * detailView = [[DetailViewController alloc] init];
    detailView.delegate = self;
    
    [self.navigationController pushViewController:detailView animated:YES];
    self.currentText = [self.arrayEvents objectAtIndex:indexPath.row];
}

@end
