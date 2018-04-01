//
//  XWBottonListView.h
//  新闻
//
//  Created by user on 15/9/5.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    FootButtonTypePic, //无图按钮
    FootButtonTypeNight,  //白天 夜间按钮
    FootButtonTypeSetting //设置按钮
    
}FootButtonType;

@class XWBottomListView;

@protocol XWBottomListViewDelegate <NSObject>

@optional
-(void)footView:(XWBottomListView*)footView footTag:(FootButtonType)footTag;

@end

@interface XWBottomListView : UIView
@property (nonatomic,weak) id<XWBottomListViewDelegate> delegate;

@end
