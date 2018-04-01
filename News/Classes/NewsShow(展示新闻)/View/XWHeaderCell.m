//
//  HGScrollCell.m
//  HiGo
//
//  Created by Think_lion on 15/7/26.
//  Copyright (c) 2015年 Think_lion. All rights reserved.
//

#import "XWHeaderCell.h"
#import "XWNewsModel.h"

@interface XWHeaderCell ()
@property (nonatomic,weak) UIImageView *imageView;

@end

@implementation XWHeaderCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self){
        [self addChild];
    }
    return self;
}


-(void)addChild
{
    UIImageView *imageView=[[UIImageView alloc]init];
    imageView.frame=self.bounds;
    imageView.contentMode=UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds=YES;
    // imageView.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    [self.contentView addSubview:imageView];
    self.imageView=imageView;
    
}

-(void)setNewsModel:(XWNewsModel *)newsModel
{
    
    [XWBaseMethod loadImageWithImg:self.imageView url:newsModel.imgsrc];
}






@end
