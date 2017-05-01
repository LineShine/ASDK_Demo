//
//  NormalCollectionViewCell.m
//  ASDK_Demo
//
//  Created by 李国平 on 2017/4/30.
//  Copyright © 2017年 gpl. All rights reserved.
//

#import "NormalCollectionViewCell.h"

@implementation NormalCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _imgView.contentMode = UIViewContentModeScaleAspectFill;
    _imgView.layer.masksToBounds = YES;
}

@end
