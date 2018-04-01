//
//  XWCellItem.h
//  新闻
//
//  Created by lairen on 15/9/7.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^MyBlock)(void);  //定义一个block

@interface XWCellItem : NSObject

@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *detailTitle;
@property  (nonatomic,copy) MyBlock option;  //定义一个block的成员变量

+(instancetype)itemWithIcon:(NSString*)icon title:(NSString *)title ;

@end
