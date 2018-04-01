//
//  XWDownloadView.h
//  新闻
//
//  Created by lairen on 15/9/8.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import <UIKit/UIKit.h>


@class XWDownloadView;
@protocol XWDownloadViewDelegate <NSObject>

@optional
-(void)downloadView:(XWDownloadView*)downloadView ;

@end


@interface XWDownloadView : UIView

@property (nonatomic,weak) ASProgressPopUpView *progressView;//进度条
@property (nonatomic,weak) UIButton *closeBtn;

-(void)beginProgress;

@property (nonatomic,weak) id<XWDownloadViewDelegate> delegate;

@end
