//
//  AppDelegate.h
//  Currency
//
//  Created by Admin on 07.02.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyRootViewController.h"
#import "MainTableViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UINavigationController *navController;
@property (strong, nonatomic) MyRootViewController *frstVwCntlr;
@property (strong, nonatomic) MainTableViewController *viewCOntrollerobj;

@property (strong, nonatomic) UIWindow *window2;


@end

