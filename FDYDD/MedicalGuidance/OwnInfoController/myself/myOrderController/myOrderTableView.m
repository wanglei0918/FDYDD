//
//  myOrderTableView.m
//  FDYDD
//
//  Created by fdkj0001 on 15/11/30.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import "myOrderTableView.h"

@implementation myOrderTableView

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
    
    //陪诊cell上的布局
    self.imgBase = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(5),FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(320)-FIXWIDTHORHEIGHT(5)*2,FIXWIDTHORHEIGHT(60))];
    self.imgBase.image = [UIImage imageNamed:@"orderoff"];
    [self addSubview:self.imgBase];
    
        
    self.lblTime = [[UILabel alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(10), self.imgBase.top+FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(150), FIXWIDTHORHEIGHT(25))];
    [self.imgBase addSubview:self.lblTime];
    [self.lblTime setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(12)]];
    self.lblTime.text = @"2015年9月22号 下午 13:30";
 //    self.lblTime.backgroundColor = [UIColor yellowColor];
 //   self.lblTime.textAlignment = NSTextAlignmentRight;
    
    
    self.imgHead = [[UIImageView alloc] initWithFrame:CGRectMake(self.lblTime.left, self.lblTime.bottom, FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(20))];
    self.imgHead.image = [UIImage imageNamed:@"contact"];
    [self.imgBase addSubview:self.imgHead];
    
    self.lblName = [[UILabel alloc] initWithFrame:CGRectMake(self.imgHead.right, self.lblTime.bottom, FIXWIDTHORHEIGHT(40), FIXWIDTHORHEIGHT(25))];
    [self.imgBase addSubview:self.lblName];
    [self.lblName setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(12)]];
    self.lblName.text = @"医点点";
    self.lblName.textAlignment = NSTextAlignmentCenter;
//    self.lblName.backgroundColor = [UIColor yellowColor];

    self.lblPerson = [[UILabel alloc] initWithFrame:CGRectMake(self.lblName.right, self.lblTime.bottom, FIXWIDTHORHEIGHT(40), FIXWIDTHORHEIGHT(25))];
    [self.imgBase addSubview:self.lblPerson];
    [self.lblPerson setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(12)]];
    self.lblPerson.text = @"先生";
    self.lblPerson.textAlignment = NSTextAlignmentCenter;
//    self.lblPerson.backgroundColor = [UIColor yellowColor];
    
    
   self.imgHospital = [[UIImageView alloc] initWithFrame:CGRectMake(self.lblPerson.right+FIXWIDTHORHEIGHT(10), self.lblTime.bottom, FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(20))];
    self.imgHospital.image = [UIImage imageNamed:@"hospital"];
    [self.imgBase addSubview:self.imgHospital];
    [self.imgBase addSubview:self.imgHospital];
    
    self.lblHospital = [[UILabel alloc] initWithFrame:CGRectMake(self.imgHospital.right+FIXWIDTHORHEIGHT(5), self.lblTime.bottom, FIXWIDTHORHEIGHT(150), FIXWIDTHORHEIGHT(25))];
    self.lblHospital.text = @"杭州市第一人民医院";
     [self.lblHospital setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(12)]];
    [self.imgBase addSubview:self.lblHospital];
     [self.imgBase addSubview:self.lblHospital];
    
    
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
