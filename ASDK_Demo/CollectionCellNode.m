//
//  CollectionCellNode.m
//  ASDK_Demo
//
//  Created by 李国平 on 2017/4/30.
//  Copyright © 2017年 gpl. All rights reserved.
//

#import "CollectionCellNode.h"
#import "PhotoModel.h"

@interface CollectionCellNode ()

@property (nonatomic, strong) ASDisplayNode *bgViewNode;
@property (nonatomic, strong) ASNetworkImageNode *imgViewNode;
@property (nonatomic, strong) ASTextNode *labelNode;

@end

@implementation CollectionCellNode

- (instancetype)initWithData:(id)dataModel {
    if (self = [super init]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        PhotoModel *model = (PhotoModel *)dataModel;
        
        ASDisplayNode *bgViewNode = [[ASDisplayNode alloc] init];
        bgViewNode.backgroundColor = [UIColor redColor];
        [self addSubnode:bgViewNode];
        self.bgViewNode = bgViewNode;
        
        ASNetworkImageNode *imgViewNode = [[ASNetworkImageNode alloc] init];
        imgViewNode.backgroundColor = [UIColor greenColor];
        imgViewNode.URL = [NSURL URLWithString:model.imgUrl];
        imgViewNode.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubnode:imgViewNode];
        self.imgViewNode = imgViewNode;
        
        ASTextNode *labelNode = [[ASTextNode alloc] init];
        //居中
        NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.alignment = NSTextAlignmentCenter;
        
        labelNode.attributedText = [[NSAttributedString alloc] initWithString:model.text attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18],
                                                                                                      NSForegroundColorAttributeName:[UIColor blackColor],
                                                                                                      NSBackgroundColorAttributeName : [UIColor clearColor],
                                                                                                      NSParagraphStyleAttributeName:paragraphStyle}];
        [self addSubnode:labelNode];
        self.labelNode = labelNode;
        
    }
    return self;
}

#pragma mark - 布局
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    //
    ASInsetLayoutSpec *bgInset = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsZero child:_bgViewNode];
    //
    ASInsetLayoutSpec *imgInset = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(2, 2, 2, 2) child:_imgViewNode];
    //
    ASInsetLayoutSpec *lbInset = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(INFINITY, 0, 0, 0) child:_labelNode];
    
    ASBackgroundLayoutSpec *backgroundLayout = [ASBackgroundLayoutSpec backgroundLayoutSpecWithChild:imgInset background:bgInset];
    
    return [ASBackgroundLayoutSpec backgroundLayoutSpecWithChild:lbInset background:backgroundLayout];
}

@end
