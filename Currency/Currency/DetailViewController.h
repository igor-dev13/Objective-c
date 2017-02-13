//
//  ViewController.h
//  Currency
//
//  Created by Admin on 07.02.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@protocol DataRowDelegate <NSObject>
- (void) setPageValue: (DetailViewController*) sender;
@end

@interface DetailViewController : UIViewController<UITableViewDelegate>
@property (nonatomic, weak) id <DataRowDelegate> delegate;
@property (nonatomic, strong) UILabel * dataLabel;
@end
