//
//  MainTableViewController.h
//  Currency
//
//  Created by Admin on 07.02.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface MainTableViewController : UITableViewController <DataRowDelegate>

@property (nonnull, nonatomic, strong) NSString * currentText;

@end
