//
//  Header.h
//  FDYDD
//
//  Created by fdkj0001 on 15/11/17.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#ifndef Header_h
#define Header_h


#if DEBUG

#define NSLog(FORMAT, ...) fprintf(stderr,"[%s:%d行] %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#else

#define NSLog(FORMAT, ...) nil

#endif


#define iPHone6Plus ([UIScreen mainScreen].bounds.size.height == 736) ? YES : NO

#define iPHone6 ([UIScreen mainScreen].bounds.size.height == 667) ? YES : NO

#define iPHone5 ([UIScreen mainScreen].bounds.size.height == 568) ? YES : NO

#define iPHone4oriPHone4s ([UIScreen mainScreen].bounds.size.height == 480) ? YES : NO

/**
 *  屏幕宽
 */
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

/**
 *  屏幕高
 */
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

/**
 *  适配iphone6和6+ 宽度或高度补偿
 */

#define IPHONE6W 375      //此处看适配机型
#define IPHONE6H 667


#define WIDTH  SCREEN_WIDTH / 375
#define HEIGHT SCREEN_HEIGHT / 667


/**
 *  RGB颜色简化(不设置透明度)
 */
#define RGBCOLOR(r,g,b)    [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
/**
 *  RGB颜色简化(设置透明度)
 */
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define FIXWIDTHORHEIGHT(widthorheight) (SCREEN_WIDTH > 320 ?  widthorheight * SCREEN_WIDTH/320.0 : widthorheight)




//评分处的图片
#define kBACKGROUND_STAR @"ratingoff@2x"
#define kFOREGROUND_STAR @"ratingon@2x"
#define kNUMBER_OF_STAR  5


#endif /* Header_h */
