//
//  XWNewsCell.m
//  新闻
//
//  Created by user on 15/10/2.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "XWNewsCell.h"
#import "XWNewsFrameModel.h"
#import "XWNewsModel.h"
#import "XWNewsView.h"

@interface XWNewsCell ()

@property (nonatomic,weak) XWNewsView *newsView;

@end

@implementation XWNewsCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //1.创建子控件
        [self setupControl];
        //2.设置选中颜色
        UIView *v=[[UIView alloc]init];
        v.backgroundColor=XWColorRGBA(20, 20, 20, 0.2);
        self.selectedBackgroundView=v;
    }
    return self;
}

+(instancetype)cellWithTableView:(UITableView *)tableView indextifier:(NSString *)indextifier
{
    XWNewsCell *cell=[tableView dequeueReusableCellWithIdentifier:indextifier];
    if(cell==nil){
        cell=[[XWNewsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indextifier];
    }
    return cell;
}

/*
    添加子控件
 */

-(void)setupControl
{
    XWNewsView *newsView=[[XWNewsView alloc]init];
    [self.contentView addSubview:newsView];
    self.newsView=newsView;
}

-(void)setFrameModel:(XWNewsFrameModel *)frameModel
{
    _frameModel=frameModel;
    self.newsView.frameModel=frameModel;
}

@end
