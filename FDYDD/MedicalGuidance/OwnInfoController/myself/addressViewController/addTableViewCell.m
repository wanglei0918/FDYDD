//
//  addTableViewCell.m
//  FDYDD
//
//  Created by fdkj0001 on 15/12/8.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import "addTableViewCell.h"

@implementation addTableViewCell


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

    self.imgbase = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(320)-FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(70))];
    self.imgbase.image = [UIImage imageNamed:@"bg-6"];
    [self addSubview:self.imgbase];
    
    self.lblname = [[UILabel alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(15), FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(25))];
    self.lblname.text = @"刘诺一";
    self.lblname.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
//    self.lblname.textAlignment = NSTextAlignmentCenter;
//    self.lblname.backgroundColor = [UIColor lightGrayColor];
    [self.imgbase addSubview:self.lblname];
    
    self.lblsex = [[UILabel alloc] initWithFrame:CGRectMake(self.lblname.right, FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(40), FIXWIDTHORHEIGHT(25))];
    self.lblsex.text = @"先生";
    self.lblsex.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
//    self.lblsex.backgroundColor = [UIColor lightGrayColor];
    [self.imgbase addSubview:self.lblsex];
    
    self.lblphone = [[UILabel alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(320)-FIXWIDTHORHEIGHT(150), FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(100), FIXWIDTHORHEIGHT(25))];
    self.lblphone.text = @"18657112345";
    self.lblphone.textAlignment = NSTextAlignmentCenter;
    self.lblphone.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
//    self.lblphone.backgroundColor = [UIColor lightGrayColor];
    [self.imgbase addSubview:self.lblphone];

    self.lbladdress = [[UILabel alloc] initWithFrame:CGRectMake(self.lblname.left,self.lblname.bottom+FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(150), FIXWIDTHORHEIGHT(25))];
    self.lbladdress.text = @"杭州滨江区东信大道388号";
    self.lbladdress.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(12)];
//    self.lbladdress.backgroundColor = [UIColor lightGrayColor];
    [self.imgbase addSubview:self.lbladdress];

    self.imgedit = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(320)-FIXWIDTHORHEIGHT(50), FIXWIDTHORHEIGHT(30), FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(20))];
    self.imgedit.image = [UIImage imageNamed:@"editor"];
    [self.imgbase addSubview:self.imgedit];

       
}



- (void)awakeFromNib {
    // Initialization code
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
