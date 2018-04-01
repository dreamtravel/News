//
//  XWSwitchItem.m
//  新闻
//
//  Created by lairen on 15/9/7.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "XWSwitchItem.h"

@implementation XWSwitchItem

+(instancetype)itemWithIcon:(NSString*)icon title:(NSString *)title
{
    XWSwitchItem *item=[[XWSwitchItem alloc]init];
    item.icon=icon;
    item.title=title;
    
    return item;
}

@end
