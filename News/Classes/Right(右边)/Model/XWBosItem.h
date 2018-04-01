//
//  XWBosItem.h
//  新闻
//
//  Created by lairen on 15/9/7.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "XWCellItem.h"

@interface XWBosItem : XWCellItem

@property (nonatomic,copy) NSString *image;
@property (nonatomic,copy) NSString *selectedImage;

+(instancetype)itemWithTitle:(NSString*)title image:(NSString*)image selectedImage:(NSString*)selectedImage;

@end
