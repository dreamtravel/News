//
//  RootViewController.m
//  新闻
//
//  Created by user on 15/9/4.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "RootViewController.h"
#import "XWNavController.h"
#import "XWHomeController.h"
#import "XWLeftMenu.h"
#import "XWRightController.h"
#import "XWFeedBackController.h"
#import "XWPushController.h"
#import "XWReporterController.h"
#import "XWMediaController.h"
#import "XWSettingController.h"

//定义左边菜单栏的宽、高 y
#define LeftMenuW    ScreenWidth*0.65

#define Timer 0.25
//覆盖层按钮的tag
#define buttonTag 1200


@interface RootViewController ()<XWLeftMenuDelegate,XWRightControllerDelegate,XWTopMenuDelegate,XWCentreViewDelegate,XWBottomListViewDelegate>

//左边菜单栏
@property (nonatomic,weak)  XWLeftMenu *leftMenu;
//当前显示的控制器
@property (nonatomic,strong) XWNavController *showNavController;
//右边的控制器
@property (nonatomic,strong) XWRightController *rightVc;

@end

@implementation RootViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //1.添加背景图片
    [self addBackgroundImage];
    //2.添加左边菜单栏
    [self setupLeftMenu];
    //3.添加子控制器
    [self addChildControllers];
    //4.添加右边的控制栏
    [self addRightMenu];
}

#pragma mark 添加而背景图片
-(void)addBackgroundImage
{
    UIImageView *bak=[[UIImageView alloc]initWithFrame:self.view.bounds];
    bak.image=[UIImage imageNamed:@"default_cover_gaussian"];
    [self.view addSubview:bak];
}
#pragma mark 添加左边菜单栏
-(void)setupLeftMenu
{
    XWLeftMenu *leftMenu=[[XWLeftMenu alloc]initWithFrame:CGRectMake(0, 0, LeftMenuW, self.view.height)];
    [self.view insertSubview:leftMenu atIndex:1];
    leftMenu.delegate=self;
    self.leftMenu=leftMenu;
}
#pragma mark 添加右边的控制器
-(void)addRightMenu
{
    XWRightController *right=[[XWRightController alloc]init];
    right.delegate=self; //头像点击的代理
    CGFloat rightX=ScreenWidth-ScreenWidth*RightRatio;
    right.view.x=rightX;
    right.view.width=ScreenWidth*RightRatio-5;
    [self.view insertSubview:right.view atIndex:1];
    //头像下面菜单的点击代理
    right.topMenu.delegete=self;
    //右边中间按钮视图的代理
    right.centreView.delegate=self;
    //右边底部按钮的代理
    right.footListView.delegate=self;
    
    self.rightVc=right;
}

#pragma mark 添加子控制器
-(void)addChildControllers
{
    //1.首页
    XWHomeController *home=[[XWHomeController alloc]init];
    [self setupController:home title:@"新闻"];
    //2.添加订阅控制器
    UIViewController *read=[[UIViewController alloc]init];
    [self setupController:read title:@"订阅"];
    //3.图片
    UIViewController *imgVC=[[UIViewController alloc]init];
    [self setupController:imgVC title:@"图片"];
    //4.视频
    UIViewController *video=[[UIViewController alloc]init];
    [self setupController:video title:@"视频"];
    //5.跟帖
    UIViewController *reply=[[UIViewController alloc]init];
    [self setupController:reply title:@"跟帖"];
    //6.电台
    UIViewController *audio=[[UIViewController alloc]init];
    [self setupController:audio title:@"电台"];
}

#pragma mark 添加子控制器详细方法
-(void)setupController:(UIViewController*)vc title:(NSString*)title
{
    if(self.childViewControllers.count>=1){
       vc.view.backgroundColor=XWRandomColor;
    }
    
    XWNavController *nav=[[XWNavController alloc]initWithRootViewController:vc];
    vc.title=title;
    vc.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithLeftIcon:@"top_navigation_menuicon" highIcon:@"" target:self action:@selector(leftClick)];
    vc.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithRightIcon:@"top_navigation_infoicon" highIcon:@"" target:self action:@selector(rightClick)];
    
    [self addChildViewController:nav];
    //如果是首页 则添加首页view
    if(self.childViewControllers.count==1){
        self.showNavController=nav;
        [self.view addSubview:nav.view];
    }
}

#pragma mark 导航栏左边按钮点击的方法
-(void)leftClick
{
    self.leftMenu.hidden=NO;
    self.rightVc.view.hidden=YES;
    //1.先调整左边菜单的动画属性   然后在下面的block里面 在调回去
    CGAffineTransform scaleform=CGAffineTransformMakeScale(0.9, 0.9);
    CGAffineTransform anim=CGAffineTransformTranslate(scaleform, -80, 0);
    self.leftMenu.transform=anim;
    
    //2.
    [UIView animateWithDuration:Timer animations:^{
        //调回左边菜单的动画属性
        self.leftMenu.transform=CGAffineTransformIdentity;
        //1.算出缩放比例
        CGFloat navH=ScreenHeight-2*LeftMenuButtonY;
        CGFloat scale=navH/ScreenHeight; //比例
        //2.左边菜单的距离
        CGFloat leftMargin=ScreenWidth*(1-scale)*0.5; //缩放后首页视图距离两边的距离
        CGFloat translateX=(LeftMenuW-leftMargin)/scale;
        //3.设置移动 缩放
        CGAffineTransform scaleForm=CGAffineTransformMakeScale(scale, scale);
        CGAffineTransform translateForm=CGAffineTransformTranslate(scaleForm, translateX, 0);
        self.showNavController.view.transform=translateForm;
        //4.创建一个按钮覆盖首页
        UIButton *cover=[[UIButton alloc]initWithFrame:self.showNavController.view.bounds];
        cover.tag=buttonTag; //设置按钮的tag
        [cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.showNavController.view addSubview:cover];
    }];
    
}
#pragma mark 导航栏右边按钮点击的方法
-(void)rightClick
{
    //隐藏左边菜单栏
    self.leftMenu.hidden=YES;
    self.rightVc.view.hidden=NO; //显示右边菜单栏
    
    self.rightVc.backgroundView.transform=CGAffineTransformMakeScale(0.8, 0.8);
    self.rightVc.view.alpha=0.5;
    
    [UIView animateWithDuration:Timer animations:^{
        //调回左边菜单的动画属性
        self.leftMenu.transform=CGAffineTransformIdentity;
        //设置右边的view动画返回
        self.rightVc.backgroundView.transform=CGAffineTransformIdentity;
        self.rightVc.view.alpha=1;
        //1.算出缩放比例
        CGFloat navH=ScreenHeight-2*LeftMenuButtonY;
        CGFloat scale=navH/ScreenHeight; //比例
        //2.左边菜单的距离
        CGFloat rightMargin=ScreenWidth*(1-scale)*0.5; //缩放后首页视图距离两边的距离
        CGFloat translateX=-(ScreenWidth*RightRatio-rightMargin)/scale;
        //3.设置移动 缩放
        CGAffineTransform scaleForm=CGAffineTransformMakeScale(scale, scale);
        CGAffineTransform translateForm=CGAffineTransformTranslate(scaleForm, translateX, 0);
        self.showNavController.view.transform=translateForm;
        //4.创建一个按钮覆盖首页
        UIButton *cover=[[UIButton alloc]initWithFrame:self.showNavController.view.bounds];
        cover.tag=buttonTag; //设置按钮的tag
        [cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.showNavController.view addSubview:cover];
    }];
    
}


#pragma mark 点击覆盖按钮返回
-(void)coverClick:(UIButton*)cover
{
    
    [UIView animateWithDuration:Timer animations:^{
        //设置左边菜单的动画属性
        CGAffineTransform scaleform=CGAffineTransformMakeScale(0.9, 0.9);
        CGAffineTransform anim=CGAffineTransformTranslate(scaleform, -80, 0);
        self.leftMenu.transform=anim;
        //设置右边view的动画属性
        self.rightVc.backgroundView.transform=CGAffineTransformMakeScale(0.8, 0.8);
        self.rightVc.view.alpha=0.5;
        
        self.showNavController.view.transform=CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [cover removeFromSuperview]; //移除按钮
    }];
}

#pragma mark 左边菜单栏按钮点击的代理方法
-(void)leftMenu:(XWLeftMenu *)leftMenu didSelectedFrom:(NSInteger)from to:(NSInteger)to
{
    //1.取出上一个控制器
    XWNavController *lastNav=self.childViewControllers[from];
    [lastNav.view removeFromSuperview];
    //2.要切换到的控制器
    XWNavController *nav=self.childViewControllers[to];
    nav.view.transform=lastNav.view.transform; //赋值动画属性
    [self.view addSubview:nav.view];
    self.showNavController=nav;
    
    [self coverClick:(UIButton*)[nav.view viewWithTag:buttonTag]];
    
}


#pragma mark 右边头像点击的方法
-(void)righrVc:(XWRightController *)rightVc headerTap:(NSInteger)headerTap
{
    [self jumpLoginVc];
}
#pragma mark 头像下面菜单的点击代理
-(void)topMenu:(XWTopMenu *)topMenu menuType:(topMenuType)menuType
{
    switch (menuType) {
        case topMenuCollect:
        case topMenuComment:
        case topMenuRead:
        {
            //跳转到登陆控制器
            [self jumpLoginVc];
        }
            break;
            
    }
}

#pragma mark 右边中间按钮视图的代理方法
-(void)centreView:(XWCentreView *)centreView centreTag:(buttonType)centreTag
{
    switch (centreTag) {
        case buttonTypeDownload: //下载按钮点击操作
            NSLog(@"下载");
            [centreView downloadWithTag:buttonTypeDownload];
            break;
        case buttonTypePush: //推送按钮点击操作
        {
            XWPushController *push=[[XWPushController alloc]init];
            push.title=@"推送消息";
            [self jumpToVc:push];
        }
            
            break;
        case buttonTypeMedia:   //媒体影响力按钮点击操作
        {
            XWMediaController *media=[[XWMediaController alloc]init];
            media.title=@"媒体影响力";
            [self jumpToVc:media];
        }
            break;
        case buttonTypeReporter:   //记者影响力按钮点击操作
        {
            XWReporterController *reporter=[[XWReporterController alloc]init];
            reporter.title=@"记者影响力";
            [self jumpToVc:reporter];
        }
            break;
        case buttonTypeFeedback:   //意见反馈按钮点击操作
        {
            XWFeedBackController *feedBack=[[XWFeedBackController alloc]init];
            [self jumpToVc:feedBack];
        }
            
            break;
    }
}

#pragma mark 右边底部按钮代理方法
-(void)footView:(XWBottomListView *)footView footTag:(FootButtonType)footTag
{
    switch (footTag) {
        case FootButtonTypeSetting:
        {
            XWSettingController *sett=[[XWSettingController alloc]init];
            [self jumpToVc:sett];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark 要跳转到神峨眉控制器
-(void)jumpToVc:(UIViewController*)vc
{
    XWNavController *nav=[[XWNavController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}

#pragma mark 跳转到登陆控制器的方法
-(void)jumpLoginVc
{
    XWLoginController *login=[[XWLoginController alloc]init];
    XWNavController *nav=[[XWNavController alloc]initWithRootViewController:login];
    [self presentViewController:nav animated:YES completion:nil];
}



@end
