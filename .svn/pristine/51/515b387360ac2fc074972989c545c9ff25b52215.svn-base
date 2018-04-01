//
//  XWLoginController.m
//  新闻
//
//  Created by user on 15/9/5.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "XWLoginController.h"
#import "XWRegisterController.h"

@interface XWLoginController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *lossPassword;

@property (weak, nonatomic) IBOutlet UIButton *qucikRegisterBtn;


- (IBAction)registerClick:(id)sender;

@end

@implementation XWLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.添加退出当前页的按钮
    [self setupNavRight];
    //2.给view添加识别手势
    [self addGesture];
}

#pragma mark 添加退出当前页的按钮
-(void)setupNavRight
{
    self.title=@"登陆我的新闻";
    
    //添加右边的导航栏的按钮
    if(!self.dismissType){
        UIBarButtonItem *rightItem=[UIBarButtonItem itemWithRightIcon:@"search_close_btn" highIcon:nil target:self action:@selector(quit)];
        self.navigationItem.rightBarButtonItem=rightItem;
    }
    
    //添加左边导航栏的按钮
    UIBarButtonItem *leftItem=[UIBarButtonItem itemWithLeftIcon:@"weather_back" highIcon:nil edgeInsets:UIEdgeInsetsMake(0, -13, 0, 13) target:self action:@selector(quit)];
    self.navigationItem.leftBarButtonItem=leftItem;
    
    
    
    //1.设置登陆密码的背景图片
    [self.loginButton setBackgroundImage:[UIImage resizedImage:@"login_tip_button"] forState:UIControlStateNormal];
    [self.loginButton setBackgroundImage:[UIImage resizedImage:@"login_tip_button_highlight"] forState:UIControlStateHighlighted];
    
    //2.设置忘记密码的背景图片
    self.lossPassword.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
    self.lossPassword.contentEdgeInsets=UIEdgeInsetsMake(0, 5, 0, 0);
    [self.lossPassword setBackgroundImage:[UIImage imageNamed:@"login_forgot_button"] forState:UIControlStateNormal];
    //3.设置手机号快速注册按钮的背景图片
    self.qucikRegisterBtn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
    self.qucikRegisterBtn.contentEdgeInsets=UIEdgeInsetsMake(0, 10, 0, 0);
    [self.qucikRegisterBtn setBackgroundImage:[UIImage resizedImage:@"login_forgot_button"] forState:UIControlStateNormal];
}


#pragma mark 给当前view添加识别手势
-(void)addGesture
{
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:tap];
}

-(void)tap
{
    [self.view endEditing:YES];
}

-(void)quit
{
    if(self.dismissType){
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}

//点击注册的方法
- (IBAction)registerClick:(id)sender {
    XWRegisterController *regist=[[XWRegisterController alloc]init];
    [self.navigationController pushViewController:regist animated:YES];
    
}
@end











