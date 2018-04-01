//
//  XWTopMenu.h
//  新闻
//
//  Created by user on 15/9/4.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

//定义枚举
typedef enum
{
    topMenuRead, //阅读按钮的tag
    topMenuComment,  //评论按钮的tag
    topMenuCollect   //收藏按钮的tag
    
}topMenuType;

@class XWTopMenu;
@protocol XWTopMenuDelegate <NSObject>

@optional
-(void)topMenu:(XWTopMenu*)topMenu menuType:(topMenuType)menuType;

@end

@interface XWTopMenu : UIView

//代理
@property (nonatomic,weak) id<XWTopMenuDelegate> delegete;

@end
