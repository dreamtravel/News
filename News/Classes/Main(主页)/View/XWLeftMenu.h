//
//  XWLeftMenu.h
//  新闻
//
//  Created by user on 15/9/4.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

//左边菜单最上面按钮的y值
#define  LeftMenuButtonY  50

@class XWLeftMenu;
@protocol XWLeftMenuDelegate <NSObject>

@optional
-(void)leftMenu:(XWLeftMenu*)leftMenu didSelectedFrom:(NSInteger)from to:(NSInteger)to;

@end


@interface XWLeftMenu : UIView

@property (nonatomic,weak) id<XWLeftMenuDelegate> delegate;

@end
