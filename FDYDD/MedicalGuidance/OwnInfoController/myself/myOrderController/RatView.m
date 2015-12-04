//
//  RatView.m
//  FDYDD
//
//  Created by fdkj0001 on 15/12/2.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import "RatView.h"

@interface RatView ()

@property (nonatomic, strong) UIView *starBackgroundView;
@property (nonatomic, strong) UIView *starForegroundView;

@property (nonatomic, readonly) int numberOfStar;

@end


@implementation RatView


- (id)initWithFrame:(CGRect)frame numberofstar:(int)number
{
    self = [super initWithFrame:frame];
    if (self) {
        _numberOfStar = number;
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
 // self.starBackgroundView = [self buidlbaseViewWithImageName:@"ratingoff@2x_1"];
  self.starForegroundView = [self buidlStarViewWithImageName:@"ratingon@2x"];
    [self addSubview:self.starBackgroundView];
    [self addSubview:self.starForegroundView];
}



/**
 *  通过图片构建星星视图
 *
 *  @param imageName 图片名称
 *
 *  @return 星星视图
 */



- (UIView *)buidlStarViewWithImageName:(NSString *)imageName
{
    NSLog(@"55555");
    CGRect frame = self.bounds;
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.clipsToBounds = YES;
    for (int i = 0; i < self.numberOfStar; i ++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(i * frame.size.width / self.numberOfStar, 0, frame.size.width / self.numberOfStar, frame.size.height);
        [view addSubview:imageView];
        NSLog(@"创建图片");
    }
    return view;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
