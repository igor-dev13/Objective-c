//
//  ViewController.m
//  Currency
//
//  Created by Admin on 07.02.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()



@property (weak, nonatomic) IBOutlet UILabel *viewValue;



@end

@implementation DetailViewController

@synthesize tableRowValue;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.viewValue.text = self.tableRowValue;
    
    // NSLog(@"%@", self.tableRowValue);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
