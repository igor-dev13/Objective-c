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
    
    self.textLabel = [[UILabel alloc] initWithFrame:self.view.frame];
    
    [self.delegate setPageValue:self];
    
    self.textLabel.font = [UIFont systemFontOfSize:36];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.textColor = [UIColor whiteColor];
    
    UIView* overlayView = [[UIView alloc] initWithFrame:self.view.frame];
    overlayView.backgroundColor = [UIColor blueColor];
    
    overlayView.maskView = self.textLabel;
    [self.view addSubview:overlayView];
}

@end
