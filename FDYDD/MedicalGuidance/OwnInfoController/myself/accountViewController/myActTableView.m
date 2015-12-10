//
//  myActTableView.m
//  FDYDD
//
//  Created by fdkj0001 on 15/11/27.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import "myActTableView.h"

@implementation myActTableView

- (void)awakeFromNib {
    // Initialization code
}



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatSubView];
    }
    return self;
}


-(void)creatSubView
{
    int range = 100;
    if (iPHone4oriPHone4s||iPHone5) {
        range = 130;
    }
    
    self.lblConsume = [[UILabel alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(25))];
    [self addSubview:self.lblConsume];
    [self.lblConsume setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(15)]];
     self.lblConsume.text = @"消费";
 // self.lblConsume.backgroundColor = [UIColor yellowColor];
    
    self.lblTime = [[UILabel alloc] initWithFrame:CGRectMake(self.width-FIXWIDTHORHEIGHT(range), self.lblConsume.top, FIXWIDTHORHEIGHT(120), FIXWIDTHORHEIGHT(25))];
    [self addSubview:self.lblTime];
    [self.lblTime setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)]];
    self.lblTime.text = @"2015/9/22 13:30";
    self.lblTime.textAlignment = NSTextAlignmentRight;
 //   self.lblTime.backgroundColor = [UIColor yellowColor];
    
    
    self.lblSertype = [[UILabel alloc] initWithFrame:CGRectMake(self.lblConsume.left, self.lblTime.bottom, FIXWIDTHORHEIGHT(70), FIXWIDTHORHEIGHT(25))];
    [self addSubview:self.lblSertype];
    [self.lblSertype setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)]];
    self.lblSertype.text = @"服务类型:";
  //  self.lblSertype.backgroundColor = [UIColor yellowColor];
    
    
    self.lblType = [[UILabel alloc] initWithFrame:CGRectMake(self.lblSertype.right, self.lblSertype.top, FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(25))];
    [self addSubview:self.lblType];
    self.lblType.text = @"普通";
 //    self.lblType.backgroundColor = [UIColor yellowColor];
    [self.lblType setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)]];
    

    self.lblSum = [[UILabel alloc] initWithFrame:CGRectMake(self.lblTime.left+FIXWIDTHORHEIGHT(20), self.lblSertype.top, FIXWIDTHORHEIGHT(100), FIXWIDTHORHEIGHT(25))];
    [self addSubview:self.lblSum];
    self.lblSum.right = self.lblTime.right;
    self.lblSum.text = @"-300.00";
    self.lblSum.textAlignment = NSTextAlignmentRight;
 //   self.lblSum.backgroundColor = [UIColor yellowColor];
    [self.lblSum setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(18)]];
    
}






- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
