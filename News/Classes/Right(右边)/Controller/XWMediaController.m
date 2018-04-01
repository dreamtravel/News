//
//  XWMediaController.m
//  新闻
//
//  Created by lairen on 15/9/6.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "XWMediaController.h"

@interface XWMediaController ()

@end

@implementation XWMediaController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor=[UIColor whiteColor];
    
    [self setupNavButton];
}

#pragma mark 设置导航栏上面的按钮
-(void)setupNavButton
{
    //1.添加右边的导航栏的按钮
    UIBarButtonItem *rightItem=[UIBarButtonItem itemWithRightIcon:@"search_close_btn" highIcon:nil target:self action:@selector(quit)];
    self.navigationItem.rightBarButtonItem=rightItem;
    //2.添加右边的按钮
    UIBarButtonItem *leftitem=[UIBarButtonItem itemWithLeftTitle:@"媒体" target:self action:@selector(manager)];
    self.navigationItem.leftBarButtonItem=leftitem;
    
}

-(void)manager
{
    
}

-(void)quit
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
