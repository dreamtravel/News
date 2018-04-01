//
//  XWArrowItem.m
//  新闻
//
//  Created by lairen on 15/9/7.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "XWArrowItem.h"

@implementation XWArrowItem



+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title vcClass:(Class)vcClass dismissType:(NSString *)dismissType
{
        XWArrowItem *arrow=[[XWArrowItem alloc]init];
        arrow.icon=icon;
        arrow.title=title;
        arrow.vcClass=vcClass;
        arrow.dismissType=dismissType;
        return arrow;
}


@end
