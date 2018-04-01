//
//  XWCentreView.h
//  新闻
//
//  Created by user on 15/9/4.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    buttonTypeDownload, //离线下载按钮的tag
    buttonTypePush, //推送
    buttonTypeMedia, //媒体影响力
    buttonTypeReporter, //记者影响力
    buttonTypeFeedback //意见反馈
}buttonType;


@class XWCentreView;

@protocol XWCentreViewDelegate <NSObject>

@optional
-(void)centreView:(XWCentreView*)centreView centreTag:(buttonType)centreTag;

@end

@interface XWCentreView : UIView

//代理
@property (nonatomic,weak) id<XWCentreViewDelegate> delegate;
//离线下载点击的时候操作
-(void)downloadWithTag:(buttonType)tag;

@end
