//
//  XWRegisterController.m
//  新闻
//
//  Created by lairen on 15/9/6.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "XWRegisterController.h"

@interface XWRegisterController ()
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UIButton *regisButton;

- (IBAction)getCode:(id)sender;
@end

@implementation XWRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.添加退出当前页的按钮
    [self setupNavRight];
}

- (void)setupNavRight {
    //添加左边导航栏的按钮
    UIBarButtonItem *leftItem=[UIBarButtonItem itemWithLeftIcon:@"weather_back" highIcon:nil edgeInsets:UIEdgeInsetsMake(0, -13, 0, 13) target:self action:@selector(quitRegis)];
    self.navigationItem.leftBarButtonItem=leftItem;
    //1.设置title和背景色
    self.title=@"注册新闻通行证";
    self.view.backgroundColor=[UIColor whiteColor];
    //2.设置输入框
    self.phone.layer.borderColor=[UIColor lightGrayColor].CGColor;
    self.phone.layer.borderWidth=1.0;
    self.phone.leftView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 30)];
    self.phone.leftViewMode=UITextFieldViewModeAlways;
    
    self.phone.keyboardType=UIKeyboardTypeNumberPad;
    //3.设置按钮的背景图片
    [self.regisButton setBackgroundImage:[UIImage resizedImage:@"go_to_taskCentre_button"] forState:UIControlStateNormal];
}

#pragma mark 退出的方法
-(void)quitRegis
{
    //[self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)getCode:(id)sender {
    
}
@end
