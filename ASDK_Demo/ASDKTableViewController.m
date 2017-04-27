//
//  ASDKTableViewController.m
//  ASDK_Demo
//
//  Created by 李国平 on 2017/4/16.
//  Copyright © 2017年 gpl. All rights reserved.
//

#import "ASDKTableViewController.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "YYFPSLabel.h"

#import "PhotoModel.h"
#import "TableCellNode.h"

@interface ASDKTableViewController () <ASTableDelegate, ASTableDataSource>

@property (nonatomic, strong) ASTableNode *tableNode;

@end

@implementation ASDKTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"ASTableNode";
    
    [self initViews];
}

- (void)initViews {
    self.tableNode = [[ASTableNode alloc] initWithStyle:UITableViewStylePlain];
    _tableNode.dataSource = self;
    _tableNode.delegate = self;
    _tableNode.frame = self.view.bounds;
    [self.view addSubnode:_tableNode];  //等效：[self.view addSubview:_tableNode.view];
    
    //ASTableNode 不会暴露所有UITableView的的属性，所以你必须通过 tableNode 底层的 UITableView 实例去设置 UITableView 的特殊属性。
    _tableNode.view.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    YYFPSLabel *fpsLabel = [YYFPSLabel new];
    fpsLabel.frame = CGRectMake(200, 200, 50, 30);
    [self.view addSubview:fpsLabel];
}

#pragma mark - TableNode Delegate
- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

/**
 *  不支持复用
 *  该方法优先于 tableNode:nodeForRowAtIndexPath:
 */
- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoModel *model = [[PhotoModel alloc] init];
    model.text = [NSString stringWithFormat:@"Row : %ld", indexPath.row];
    model.imgUrl = _dataArray[indexPath.row];
    
    ASCellNode *(^cellBlock)() = ^ASCellNode *() {
        
        TableCellNode *cellNodel = [[TableCellNode alloc] initWithData:model];
        
//        NSIndexPath *currentIdxPath = [tableNode indexPathForNode:cellNodel];
        
        return cellNodel;
    };
    
    return cellBlock;
    
    /*
    //另一种创建方式
    return ^() {
        ASCellNode *cellNode = [[ASCellNode alloc] initWithViewBlock:^UIView * _Nonnull{
            
            UIView *bgView = [[UIView alloc] initWithFrame:CGRectZero];
            bgView.backgroundColor = [UIColor orangeColor];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 100, 30)];
            label.text = [NSString stringWithFormat:@"Row : %ld", indexPath.row];
            [bgView addSubview:label];
            
            return bgView;
        }];
        
        return cellNode;
    };
     */
}

//- (ASCellNode *)tableNode:(ASTableNode *)tableNode nodeForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//}

- (ASSizeRange)tableNode:(ASTableNode *)tableNode constrainedSizeForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGSize min = CGSizeMake(width, 380);
    CGSize max = CGSizeMake(width, CGFLOAT_MAX);
    return ASSizeRangeMake(min, max);
}

- (void)tableNode:(ASTableNode *)tableNode didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableNode deselectRowAtIndexPath:indexPath animated:YES];
    
    
}

@end
