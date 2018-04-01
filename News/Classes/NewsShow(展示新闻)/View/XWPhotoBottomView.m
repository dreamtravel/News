//
//  XWPhotoBottomView.m
//  新闻
//
//  Created by user on 15/10/4.
//  Copyright (c) 2015年 user. All rights reserved.
//


#import "XWPhotoBottomView.h"

#define marginLeft 10

@interface XWPhotoBottomView ()

@property (nonatomic,strong) NSMutableArray *btnArr;



@end

@implementation XWPhotoBottomView

-(NSMutableArray *)btnArr
{
    if(_btnArr==nil){
        _btnArr=[NSMutableArray array];
    }
    return _btnArr;
}

-(instancetype)init
{
    self=[super init];
    if(self){
        self.width=ScreenWidth;
        self.height=photoBottomH;
        //添加按钮
        [self addButtons];
    }
    return self;
}

-(void)addButtons
{
    //
    [self addButtonWithImg:@"top_navigation_more" tag:buttonDownloadType];
    [self addButtonWithImg:@"weather_share" tag:buttonShareType];
    [self addButtonWithImg:@"icon_star" selectedImg:@"icon_star_full" tag:buttonLikeType];
}

-(void)addButtonWithImg:(NSString*)img tag:(buttonType)tag
{
    UIButton *btn=[[UIButton alloc]init];
    [btn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    btn.tag=tag;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.btnArr addObject:btn];
    [self addSubview:btn];
}

-(void)addButtonWithImg:(NSString*)img selectedImg:(NSString*)selectedImg tag:(buttonType)tag
{
    UIButton *btn=[[UIButton alloc]init];
    [btn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectedImg] forState:UIControlStateSelected];
    btn.tag=tag;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.btnArr addObject:btn];
    [self addSubview:btn];
}

-(void)btnClick:(UIButton*)sender
{
    switch (sender.tag) {
        case buttonDownloadType:
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"保存图片被阻止了" message:@"请到系统\"设置>隐私>照片\"中开启界面新闻访问权限" delegate:nil cancelButtonTitle:@"好" otherButtonTitles:nil, nil];
            [alert show];
        }
            break;
        case buttonShareType:
        {
            
        }
        break;
            
        case buttonLikeType:{
            sender.selected=!sender.isSelected;
        }
            break;
    }
}


-(void)layoutSubviews
{
    NSInteger count=self.btnArr.count;
    CGFloat btnW=ScreenWidth*0.5/count;
    CGFloat btnH=self.height;
    CGFloat btnY=0;
    CGFloat marginF=ScreenWidth*(1-0.5);
    if(iPhone6){
         
    }
    
    CGFloat btnX=0;
    
    for(int i=0;i<(int)count;i++){
        UIButton *btn=self.btnArr[i];
        btnX=btnW*i+marginF;
        btn.frame=CGRectMake(btnX, btnY, btnW, btnH);
       
    }
}

@end
