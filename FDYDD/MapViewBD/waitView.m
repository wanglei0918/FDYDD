//
//  waitView.m
//  FDYDD
//
//  Created by fdkj0001 on 15/11/25.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import "waitView.h"

@implementation waitView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatSubView];
    }
    return self;
}
-(void)creatSubView
{
   //医药箱的小人
    self.imgDtoready = [[UIImageView alloc] init];
    [self addSubview:self.imgDtoready];
    [self.imgDtoready mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).with.offset(FIXWIDTHORHEIGHT(25));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(50), FIXWIDTHORHEIGHT(65)));
    }];
    self.imgDtoready.image = [UIImage imageNamed:@"doctorready"];
    
    self.lbltitle  = [[UILabel alloc] init];
    [self addSubview:self.lbltitle];
    [self.lbltitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.imgDtoready).with.offset(FIXWIDTHORHEIGHT(25));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(200), FIXWIDTHORHEIGHT(25)));
    }];
    self.lbltitle.textAlignment = NSTextAlignmentCenter;
    self.lbltitle.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    self.lbltitle.text = @"陪诊人员正在为您服务";
    
    
    //目标医院图片和lbl
    self.imgTarget = [[UIImageView alloc] initWithFrame:CGRectMake(self.left+FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(130), FIXWIDTHORHEIGHT(25), FIXWIDTHORHEIGHT(25))];
    self.imgTarget.image = [UIImage imageNamed:@"target"];
    [self addSubview:self.imgTarget];
    
    self.lblhospital = [[UILabel alloc] initWithFrame:CGRectMake(self.imgTarget.right+FIXWIDTHORHEIGHT(5), self.imgTarget.top, FIXWIDTHORHEIGHT(200), FIXWIDTHORHEIGHT(30))];
    self.lblhospital.text = @"目标医院：杭州市第一人民医院";
    self.lblhospital.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [self addSubview:self.lblhospital];
    
    
     //时间图片和lbl
    self.imgTime = [[UIImageView alloc] initWithFrame:CGRectMake(self.imgTarget.left, self.imgTarget.bottom+FIXWIDTHORHEIGHT(25), FIXWIDTHORHEIGHT(25), FIXWIDTHORHEIGHT(25))];
    self.imgTime.image = [UIImage imageNamed:@"time"];
    [self addSubview:self.imgTime];
    self.lbltime = [[UILabel alloc] initWithFrame:CGRectMake(self.imgTime.right+FIXWIDTHORHEIGHT(5), self.imgTime.top, FIXWIDTHORHEIGHT(150), FIXWIDTHORHEIGHT(30))];
    self.lbltime.text = @"10月10日11：00";
    self.lbltime.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [self addSubview:self.lbltime];
    
    
    
    
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
