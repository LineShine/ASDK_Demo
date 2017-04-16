//
//  ViewController.m
//  ASDK_Demo
//
//  Created by 李国平 on 2017/4/14.
//  Copyright © 2017年 gpl. All rights reserved.
//

#import "ViewController.h"
#import "NormalTableViewController.h"
#import "NormalCollectionViewController.h"
#import "ASDKTableViewController.h"
#import "ASDKCollectionViewController.h"

@interface ViewController () 

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)showUITableView:(id)sender {
    NormalTableViewController *tbVC = [[NormalTableViewController alloc] init];
    [self.navigationController pushViewController:tbVC animated:YES];
}

- (IBAction)showASTableNode:(id)sender {
    ASDKTableViewController *tbVC = [[ASDKTableViewController alloc] init];
    [self.navigationController pushViewController:tbVC animated:YES];
}

- (IBAction)showUICollectionView:(id)sender {
    NormalCollectionViewController *colVC = [[NormalCollectionViewController alloc] init];
    [self.navigationController pushViewController:colVC animated:YES];
}

- (IBAction)showASCollectionNode:(id)sender {
    ASDKCollectionViewController *colVC = [[ASDKCollectionViewController alloc] init];
    [self.navigationController pushViewController:colVC animated:YES];
}


@end
