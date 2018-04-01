//
//  XWArrowItem.h
//  新闻
//
//  Created by lairen on 15/9/7.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "XWCellItem.h"

@interface XWArrowItem : XWCellItem

@property (nonatomic,assign) Class vcClass;
@property (nonatomic,copy) NSString *dismissType;

+(instancetype)itemWithIcon:(NSString*)icon title:(NSString *)title vcClass:(Class)vcClass dismissType:(NSString*)dismissType;

@end
