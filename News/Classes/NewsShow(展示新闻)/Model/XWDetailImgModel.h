//
//  XWDetailImgModel.h
//  新闻
//
//  Created by user on 15/10/3.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XWDetailImgModel : NSObject

//新闻详情的model
@property (nonatomic, copy) NSString *src;
/** 图片尺寸 */
@property (nonatomic, copy) NSString *pixel;
/** 图片所处的位置 */
@property (nonatomic, copy) NSString *ref;

+(instancetype)initWithDict:(NSDictionary*)dict;

@end
