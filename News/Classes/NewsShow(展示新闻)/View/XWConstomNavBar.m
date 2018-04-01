//
//  XWConstomNavBar.m
//  新闻
//
//  Created by user on 15/10/3.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "XWConstomNavBar.h"

@implementation XWConstomNavBar

-(instancetype)init
{
    self=[super init];
    if(self){
        [self setupFirst];
    }
    return self;
}

-(void)setupFirst
{
    self.backgroundColor=[UIColor whiteColor];
    self.frame=CGRectMake(0, 0, ScreenWidth, 64);
    //底部添加一条线
    UIImageView *line=[[UIImageView alloc]init];
    line.backgroundColor=XWColorRGBA(20, 20, 20, 0.3);
    [self addSubview:line];
    line.frame=CGRectMake(0, self.height-0.3, self.width, 0.3);
    
}

@end
