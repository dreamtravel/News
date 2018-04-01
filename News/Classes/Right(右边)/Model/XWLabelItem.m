//
//  XWLabelItem.m
//  新闻
//
//  Created by lairen on 15/9/7.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "XWLabelItem.h"

@implementation XWLabelItem

+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title cacheSize:(NSString *)cacheSize
{
    XWLabelItem *item=[[XWLabelItem alloc]init];
    item.icon=icon;
    item.title=title;
    item.cacheSize=cacheSize;
    return item;
}

@end
