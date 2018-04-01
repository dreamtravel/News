//
//  XWSettingViewCell.m
//  新闻
//
//  Created by lairen on 15/9/7.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "XWSettingViewCell.h"
#import "XWCellItem.h"
#import "XWSettingView.h"

@interface XWSettingViewCell ()

@property (nonatomic,weak) XWSettingView *settingView;

@end

@implementation XWSettingViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //1.添加子view
        [self setupView];
    }
    
    return self;
}

+(instancetype)cellWithTableView:(UITableView *)tableView indextifier:(NSString *)indextifier
{
    XWSettingViewCell *cell=[tableView dequeueReusableCellWithIdentifier:indextifier];
    if(cell==nil){
        cell=[[XWSettingViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indextifier];
    }
    return cell;
}

#pragma mark 添加子view
-(void)setupView
{
    XWSettingView *settingView=[[XWSettingView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, self.height)];
    [self.contentView addSubview:settingView];
    self.settingView=settingView;
}

//传递模型
-(void)setItem:(XWCellItem *)item
{
    _item=item;
    self.settingView.item=item;
    //判断单元格是否可以选中
    [self setSelect];
    
}

-(void)setSelect
{

    
    if([self.item isKindOfClass:[XWSwitchItem class]] || [self.item isKindOfClass:[XWLabelItem class]] || [self.item isKindOfClass:[XWBosItem class ]]){
        
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        
    }else{
        self.selectionStyle=UITableViewCellSelectionStyleDefault;
    }
}




@end
