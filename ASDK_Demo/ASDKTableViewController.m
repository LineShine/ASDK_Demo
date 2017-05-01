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
    
    //无限滚动需要
    //将 leadingScreensForBatching 设置为 1.0 表示当用户滚动还剩 1 个全屏就到达页尾时，开始抓取新的一批数据。
    self.tableNode.view.leadingScreensForBatching = 1.0;  // default of 2.0
    
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
    
    // this may be executed on a background thread - it is important to make sure it is thread safe
    ASCellNode *(^cellBlock)() = ^ASCellNode *() {
        
        TableCellNode *cellNode = [[TableCellNode alloc] initWithData:model];
        
//        NSIndexPath *currentIdxPath = [tableNode indexPathForNode:cellNodel];
        
        return cellNode;
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

/*
#pragma mark - 无限滚动
- (BOOL)shouldBatchFetchForTableNode:(ASTableNode *)tableNode {
    return YES;
}

- (void)tableNode:(ASTableNode *)tableNode willBeginBatchFetchWithContext:(ASBatchContext *)context {
    //1
    [self retrieveNextPageWithCompletion:^(NSArray *moreData) {
        //2
        [self insertNewRowsInTableNode:moreData];
        //3 Let the context object know that a batch fetch was completed.
        [context completeBatchFetching:YES];
    }];
}

//官方文档写法
- (void)retrieveNextPageWithCompletion:(void (^)(NSArray *))block {
    //网络请求下一页数据
    NSArray *moreData = _dataArray;
    
    // Important: this block must run on the main thread
    dispatch_async(dispatch_get_main_queue(), ^{
        block(moreData);
    });
}
- (void)insertNewRowsInTableNode:(NSArray *)newData {
    NSInteger section = 0;
    NSMutableArray *indexPaths = [NSMutableArray array];
    
    NSUInteger newTotalNumberOfPhotos = self.dataArray.count + newData.count;
    for (NSUInteger row = self.dataArray.count; row < newTotalNumberOfPhotos; row++) {
        NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:section];
        [indexPaths addObject:path];
    }
    
    [self.dataArray addObjectsFromArray:newData];
    [self.tableNode insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
}
*/
@end
