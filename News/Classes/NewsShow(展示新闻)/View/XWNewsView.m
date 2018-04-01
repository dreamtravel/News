//
//  XWNewsView.m
//  新闻
//
//  Created by user on 15/10/2.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "XWNewsView.h"
#import "XWNewsFrameModel.h"
#import "XWNewsModel.h"

@interface XWNewsView ()

//  标题label
@property (nonatomic,weak) UILabel *titleLabel;
// 子标题label
@property (nonatomic,weak) UILabel *subtitleLabel;
// 图片的label
@property (nonatomic,weak) UIImageView *img;
// 第二章图片
@property (nonatomic,weak) UIImageView *otherImg1;
//第三张图片
@property (nonatomic,weak) UIImageView *otherImg2;
//回复按钮
@property (nonatomic,weak) UIButton *replyBtn;

//下划线
@property (nonatomic,weak) UIImageView *bottomLine;

@end

@implementation XWNewsView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self){
        //添加所有的子控件
        [self setupFirst];
    }
    
    return self;
}

#pragma mark 添加所有的子控件
-(void)setupFirst
{
    //1.创建标题
    UILabel *titleLabel=[[UILabel alloc]init];
    titleLabel.font=titleFont;
    [self addSubview:titleLabel];
    self.titleLabel=titleLabel;
    //2.创建子标题
    UILabel *subtitleLabel=[[UILabel alloc]init];
    subtitleLabel.font=subtitleFont;
    subtitleLabel.numberOfLines=0;
    subtitleLabel.textColor=[UIColor grayColor];
    [self addSubview:subtitleLabel];
    self.subtitleLabel=subtitleLabel;
    //3.创建图片
    UIImageView *img=[[UIImageView alloc]init];
    [self addSubview:img];
    self.img=img;
    //4.创建第二章图片
    UIImageView *otherImg1=[[UIImageView alloc]init];
   // otherImg1.hidden=YES;
    [self addSubview:otherImg1];
    self.otherImg1=otherImg1;
    //5.创建第三张图片
    UIImageView *otherImg2=[[UIImageView alloc]init];
   // otherImg2.hidden=YES;
    [self addSubview:otherImg2];
    self.otherImg2=otherImg2;
    //6.创建回复按钮
    UIButton *replyBtn=[[UIButton alloc]init];
    [replyBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [replyBtn setBackgroundImage:[UIImage resizedImage:@"night_contentcell_comment_border"] forState:UIControlStateNormal];
    replyBtn.titleLabel.font=replyFont;
    replyBtn.userInteractionEnabled=NO;
    [self addSubview:replyBtn];
    self.replyBtn=replyBtn;
    //7.下滑线
    UIImageView *bottomLine=[[UIImageView alloc]init];
    bottomLine.backgroundColor=[UIColor lightGrayColor];
    [self addSubview:bottomLine];
    self.bottomLine=bottomLine;
}


-(void)setFrameModel:(XWNewsFrameModel *)frameModel
{
    _frameModel=frameModel;
    
    if (frameModel.newsModel.hasHead && frameModel.newsModel.photosetID) {
        //如果有多张图片的  多张显示  没有的常态显示
        if(frameModel.newsModel.imgextra.count){
            [self imgextra];
        }else{
            [self normalShow];
        }
    }else if (frameModel.newsModel.hasHead){
        if(frameModel.newsModel.imgextra.count){
            [self imgextra];
        }else{
            [self normalShow];
        }
    }else if(frameModel.newsModel.imgType) { //如果是现实一张图片
         [self imgType];
        
    }else if (frameModel.newsModel.imgextra){  //多张图片显示
        [self imgextra];
        
    }else{  //正常状态下显示
    
        [self normalShow];
    }
    

}


#pragma mark 如果是一张大图片的时候
-(void)imgType;
{
    //1
    self.frame=self.frameModel.newsViewF;
    self.titleLabel.text=self.frameModel.newsModel.title;
    self.titleLabel.frame=self.frameModel.titleF;
    //2.
    [XWBaseMethod loadImageWithImg:self.img url:self.frameModel.newsModel.imgsrc];
    self.img.frame=self.frameModel.imgIconF;
    //3.
    self.subtitleLabel.text=self.frameModel.newsModel.digest;
    self.subtitleLabel.frame=self.frameModel.subtitleF;
    //4
    self.otherImg1.frame=self.frameModel.otherImg1F;
    self.otherImg2.frame=self.frameModel.otherImg2F;
    //5.
    self.replyBtn.frame=self.frameModel.replyF;
    //6.设置下滑线的frame
    self.bottomLine.frame=CGRectMake(0, self.height-0.3, ScreenWidth, 0.3);
}
#pragma mark 如果是多张图片显示
-(void)imgextra
{
    //1设置title
    self.frame=self.frameModel.newsViewF;
    self.titleLabel.text=self.frameModel.newsModel.title;
    self.titleLabel.frame=self.frameModel.titleF;
    //2.
    [XWBaseMethod loadImageWithImg:self.img url:self.frameModel.newsModel.imgsrc];
    self.img.frame=self.frameModel.imgIconF;
    //3.
    self.subtitleLabel.text=self.frameModel.newsModel.subtitle;
    self.subtitleLabel.frame=self.frameModel.subtitleF;
    //4.
    [XWBaseMethod loadImageWithImg:self.otherImg1 url:self.frameModel.newsModel.imgextra[0][@"imgsrc"]];
    self.otherImg1.frame=self.frameModel.otherImg1F;
    
    //5.
    [XWBaseMethod loadImageWithImg:self.otherImg2 url:self.frameModel.newsModel.imgextra[1][@"imgsrc"]];
    self.otherImg2.frame=self.frameModel.otherImg2F;
    
    //6
    [self.replyBtn setTitle:self.frameModel.newsModel.replyCount  forState:UIControlStateNormal];
    self.replyBtn.frame=self.frameModel.replyF;
    //7.设置下滑线的frame
    self.bottomLine.frame=CGRectMake(0, self.height-0.3, ScreenWidth, 0.3);
}

#pragma mark 正常状态下显示
-(void )normalShow
{
    //1设置标题的frame
    self.frame=self.frameModel.newsViewF;
    self.titleLabel.text=self.frameModel.newsModel.title;
    self.titleLabel.frame=self.frameModel.titleF;
    //2.
    [XWBaseMethod loadImageWithImg:self.img url:self.frameModel.newsModel.imgsrc];
    self.img.frame=self.frameModel.imgIconF;
    //3.
    if(self.frameModel.newsModel.pixel || self.frameModel.subtitleF.size.height>30){
        self.subtitleLabel.text=self.frameModel.newsModel.ptime;
    }else{
        self.subtitleLabel.text=self.frameModel.newsModel.digest;
    }
    
    
    self.subtitleLabel.frame=self.frameModel.subtitleF;
    //4.
    [self.replyBtn setTitle:self.frameModel.newsModel.replyCount forState:UIControlStateNormal];
    self.replyBtn.frame=self.frameModel.replyF;
    //5.设置其他图片
    self.otherImg1.frame=self.frameModel.otherImg1F;
    self.otherImg2.frame=self.frameModel.otherImg2F;
    //6.设置下滑线的frame
    self.bottomLine.frame=CGRectMake(0, self.height-0.3, ScreenWidth, 0.3);
}

@end
