//
//  ViewController.m
//  Currency
//
//  Created by Admin on 07.02.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "DetailViewController.h"
#import "MainTableViewController.h"

@interface DetailViewController ()
@end

@implementation DetailViewController

@synthesize dataLabel;
@synthesize delegate;

/*-(void) CreateMainTableViewController
{
    MainTableViewController *myMainTableViewController = [[MainTableViewController alloc]];
    //..... push second controller into navigation stack
    myMainTableViewController.delegate = self ;
    [myMainTableViewController release];
}*/



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // UILabel* label = [[UILabel alloc] initWithFrame:self.view.frame];
    dataLabel = [[UILabel alloc] initWithFrame:self.view.frame];
    
    [self.delegate setPageValue:self];
    
    dataLabel.font = [UIFont systemFontOfSize:36];
    dataLabel.textAlignment = NSTextAlignmentCenter;
    dataLabel.textColor = [UIColor whiteColor];
    
    UIView* overlayView = [[UIView alloc] initWithFrame:self.view.frame];
    overlayView.backgroundColor = [UIColor blueColor];
    overlayView.maskView = dataLabel;
    [self.view addSubview:overlayView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
