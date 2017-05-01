//
//  ASDKCollectionViewController.m
//  ASDK_Demo
//
//  Created by 李国平 on 2017/4/16.
//  Copyright © 2017年 gpl. All rights reserved.
//

#import "ASDKCollectionViewController.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "CollectionCellNode.h"
#import "PhotoModel.h"
#import "YYFPSLabel.h"

@interface ASDKCollectionViewController () <ASCollectionDelegate, ASCollectionDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) ASCollectionNode *collectionNode;

@end

@implementation ASDKCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"ASDKCollectionView";
    
    [self initViews];
}

- (void)initViews {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 7;
    flowLayout.minimumLineSpacing = 8;

    self.collectionNode = [[ASCollectionNode alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    _collectionNode.backgroundColor = [UIColor whiteColor];
    _collectionNode.dataSource = self;
    _collectionNode.delegate = self;
    
    //不支持复用
//    [_collectionNode.view registerClass:[CollectionCellNode class] forCellWithReuseIdentifier:@"collectID"];
    
    [self.view addSubnode:_collectionNode];
    
    YYFPSLabel *fpsLabel = [YYFPSLabel new];
    fpsLabel.frame = CGRectMake(200, 200, 50, 30);
    [self.view addSubview:fpsLabel];
}

#pragma mark - ASCollectionNode Delegate
- (NSInteger)collectionNode:(ASCollectionNode *)collectionNode numberOfItemsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (ASCellNodeBlock)collectionNode:(ASCollectionNode *)collectionNode nodeBlockForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoModel *model = [[PhotoModel alloc] init];
    model.text = [NSString stringWithFormat:@"Row : %ld", indexPath.row];
    model.imgUrl = _dataArray[indexPath.row];
    
    return ^() {
        CollectionCellNode *cellNode = [[CollectionCellNode alloc] initWithData:model];
        
        return cellNode;
    };
}

- (ASSizeRange)collectionNode:(ASCollectionNode *)collectionNode constrainedSizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 32) / 3;
    CGSize min = CGSizeMake(width, width);
    CGSize max = CGSizeMake(width, width);
    return ASSizeRangeMake(min, max);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(8, 8, 8, 8);
}

@end
