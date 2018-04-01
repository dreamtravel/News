//
//  XWNewsFrameModel.h
//  新闻
//
//  Created by user on 15/10/2.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XWNewsModel;

//标题文字的大小
#define titleFont  [UIFont systemFontOfSize:15]
//描述文字的大小
#define subtitleFont [UIFont systemFontOfSize:12]
//回复文字的大小
#define replyFont [UIFont systemFontOfSize:12]

@interface XWNewsFrameModel : NSObject

@property (nonatomic,strong)  XWNewsModel *newsModel; //新闻模型

/*
     自定义单元view的frame
 */
@property (nonatomic,assign,readonly) CGRect newsViewF;
/**
     图片的frame
 */
@property (nonatomic,assign,readonly) CGRect imgIconF;
/*
 *  标题的frame
 */
@property (nonatomic,assign,readonly) CGRect titleF;

/**
      回复数的frame
 **/
@property (nonatomic,assign,readonly) CGRect replyF;
/*
 *  描述的frame
 */
@property (nonatomic,assign,readonly) CGRect subtitleF;
/*
 *  第二张照片的frame(如果有的话)
 */
@property (nonatomic,assign,readonly) CGRect otherImg1F;
/*
 *  第三张照片的frame(如果有的话)
 */
@property (nonatomic,assign,readonly) CGRect otherImg2F;


/*
 *   单元格的高度
 */

@property (nonatomic,assign,readonly) CGFloat cellH;


@end
