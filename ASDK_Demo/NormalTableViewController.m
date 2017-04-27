//
//  NormalTableViewController.m
//  ASDK_Demo
//
//  Created by 李国平 on 2017/4/16.
//  Copyright © 2017年 gpl. All rights reserved.
//

#import "NormalTableViewController.h"
#import <UIImageView+WebCache.h>
#import "YYFPSLabel.h"

@interface NormalTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation NormalTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UITableView";
    
    [self initViews];
}

- (void)initViews {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.backgroundView = nil;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    YYFPSLabel *fpsLabel = [YYFPSLabel new];
    fpsLabel.frame = CGRectMake(200, 200, 50, 30);
    [self.view addSubview:fpsLabel];
}

#pragma mark - tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 380;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIView *bgView = [[UIView alloc] init];
        bgView.frame = CGRectMake(0, 0, 375, 360);
        bgView.backgroundColor = [UIColor redColor];
        [cell.contentView addSubview:bgView];
        
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.tag = 1000;
        imgView.frame = CGRectMake(10, 10, 355, 340);
        imgView.backgroundColor = [UIColor greenColor];
        imgView.contentMode = UIViewContentModeScaleAspectFill;
        imgView.layer.masksToBounds = YES;
        [bgView addSubview:imgView];
        
        UILabel *label = [[UILabel alloc] init];
        label.tag = 1001;
        label.font = [UIFont systemFontOfSize:18];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor blackColor];
        label.frame = CGRectMake(20, 150, 260, 30);
        [bgView addSubview:label];
    }
    
    UIImageView *imgView = (UIImageView *)[cell.contentView viewWithTag:1000];
    UILabel *label = (UILabel *)[cell.contentView viewWithTag:1001];
    
    [imgView sd_setImageWithURL:[NSURL URLWithString:_dataArray[indexPath.row]]];
    label.text = [NSString stringWithFormat:@"Row : %ld", indexPath.row];
    
    return cell;
}

@end
