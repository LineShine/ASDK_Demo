//
//  NormalCollectionViewController.m
//  ASDK_Demo
//
//  Created by 李国平 on 2017/4/16.
//  Copyright © 2017年 gpl. All rights reserved.
//

#import "NormalCollectionViewController.h"

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
    _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 49, 0);
    _collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 49, 0);
    _collectionView.alwaysBounceVertical = YES;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    //将UICollectionViewCell类的单元格 加上 cell_identy复用标记
//    [_collectionView registerClass:[FoundCollectionViewCell class] forCellWithReuseIdentifier:@"collectID"];
    
    [self.view addSubview:_collectionView];
}


@end
