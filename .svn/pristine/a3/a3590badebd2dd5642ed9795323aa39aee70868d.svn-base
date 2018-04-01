//
//  HGScroll.h
//  HiGo
//
//  Created by Think_lion on 15/7/26.
//  Copyright (c) 2015年 Think_lion. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HeaderViewH  230

@class XWHeaderView,XWNewsModel;

@protocol XWHeaderViewDelegate <NSObject>

@optional
-(void)headerView:(XWHeaderView*)headerView newsModel:(XWNewsModel*)newsModel;

@end


@interface XWHeaderView : UIView

@property (nonatomic,weak) id<XWHeaderViewDelegate> delegate;
@property (nonatomic,strong) NSMutableArray *arr;

@end
