//
//  XWNavController.m
//  新闻
//
//  Created by user on 15/9/4.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "XWNavController.h"

@interface XWNavController ()

@end

@implementation XWNavController


+(void)initialize
{
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBarTintColor:[UIColor redColor]];
    
    //[navBar setBackgroundImage:[UIImage resizedImage:@"top_navigation_background"] forBarMetrics:UIBarMetricsDefault];
    
//    navBar.barTintColor=XWColor(231, 38, 48); //设置背景色
//    [navBar setBackgroundColor:[UIColor redColor]];
    [navBar setTintColor:[UIColor whiteColor]];
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    navBar.shadowImage=[[UIImage alloc]init];  //隐藏掉导航栏底部的那条线
    //2.设置导航栏barButton上面文字的颜色
    UIBarButtonItem *item=[UIBarButtonItem appearance];
    [item setTintColor:[UIColor whiteColor]];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
}





//-(UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleDefault;
//   // return UIStatusBarStyleLightContent;
//}





@end
