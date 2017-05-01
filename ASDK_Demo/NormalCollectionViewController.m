//
//  NormalCollectionViewController.m
//  ASDK_Demo
//
//  Created by 李国平 on 2017/4/16.
//  Copyright © 2017年 gpl. All rights reserved.
//

#import "NormalCollectionViewController.h"
#import "NormalCollectionViewCell.h"
#import <UIImageView+WebCache.h>
#import "YYFPSLabel.h"
#import "NormalCollectionViewCell.h"

@interface NormalCollectionViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation NormalCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UICollectionView";
    
    [self initViews];
}

- (void)initViews {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    //将UICollectionViewCell类的单元格 加上 cell_identy复用标记
//    [_collectionView registerClass:[NormalCollectionViewCell class] forCellWithReuseIdentifier:@"collectID"];
//    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([NormalCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"collectID"];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([NormalCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"NormalCollectionViewCellID"];
    
    [self.view addSubview:_collectionView];
    
    YYFPSLabel *fpsLabel = [YYFPSLabel new];
    fpsLabel.frame = CGRectMake(200, 200, 50, 30);
    [self.view addSubview:fpsLabel];
}

#pragma mark - Collection Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NormalCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NormalCollectionViewCellID" forIndexPath:indexPath];
    
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:_dataArray[indexPath.row]]];
    cell.tipLabel.text = [NSString stringWithFormat:@"ROW:%ld", indexPath.row];
    
    return cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 8;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 8;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat w = ([[UIScreen mainScreen] bounds].size.width - 32) / 3;
    return CGSizeMake(w, w);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(8, 8, 8, 8);
}

@end
