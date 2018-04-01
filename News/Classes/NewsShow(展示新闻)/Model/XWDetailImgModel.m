//
//  XWDetailImgModel.m
//  新闻
//
//  Created by user on 15/10/3.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "XWDetailImgModel.h"

@implementation XWDetailImgModel

+(instancetype)initWithDict:(NSDictionary *)dict
{
    XWDetailImgModel *imgModel=[[XWDetailImgModel alloc]init];
    imgModel.pixel=dict[@"pixel"];
    imgModel.src=dict[@"src"];
    imgModel.ref=dict[@"ref"];
    return imgModel;
}

@end
