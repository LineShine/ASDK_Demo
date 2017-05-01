//
//  TableCellNode.m
//  ASDK_Demo
//
//  Created by 李国平 on 2017/4/16.
//  Copyright © 2017年 gpl. All rights reserved.
//

#import "TableCellNode.h"
#import "PhotoModel.h"

@interface TableCellNode () <ASNetworkImageNodeDelegate>

@end

@implementation TableCellNode

- (instancetype)initWithData:(id)dataModel {
    if (self = [super init]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        PhotoModel *model = (PhotoModel *)dataModel;
        
        ASDisplayNode *bgViewNode = [[ASDisplayNode alloc] init];
        bgViewNode.frame = CGRectMake(0, 0, 375, 360);
        bgViewNode.backgroundColor = [UIColor redColor];
        [self addSubnode:bgViewNode];
    
        ASNetworkImageNode *imgViewNode = [[ASNetworkImageNode alloc] init];
        imgViewNode.frame = CGRectMake(10, 10, 355, 340);
        imgViewNode.backgroundColor = [UIColor greenColor];
        imgViewNode.URL = [NSURL URLWithString:model.imgUrl];
        imgViewNode.delegate = self;
        imgViewNode.contentMode = UIViewContentModeScaleAspectFill;
        [bgViewNode addSubnode:imgViewNode];
        
        ASTextNode *labelNode = [[ASTextNode alloc] init];
        labelNode.frame = CGRectMake(20, 150, 260, 30);
        labelNode.attributedText = [[NSAttributedString alloc] initWithString:model.text attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18], NSForegroundColorAttributeName:[UIColor blackColor], NSBackgroundColorAttributeName : [UIColor clearColor]}];
        [bgViewNode addSubnode:labelNode];
        
    }
    return self;
}

#pragma mark - 图片下载代理
- (void)imageNode:(ASNetworkImageNode *)imageNode didLoadImage:(UIImage *)image {
    
}

- (void)imageNodeDidStartFetchingData:(ASNetworkImageNode *)imageNode {
    
}
- (void)imageNode:(ASNetworkImageNode *)imageNode didFailWithError:(NSError *)error
{
    
}
- (void)imageNodeDidFinishDecoding:(ASNetworkImageNode *)imageNode {
    
}

@end
