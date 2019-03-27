//
//  Tool.h
//  YFStock
//
//  Created by yujingjie on 15/9/17.
//  Copyright (c) 2015年 Yifa Network. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Tool : NSObject


+(BOOL)checkTel:(NSString *)str;

+ (UIImage*)creatBackground:(CGRect)rect fillColor:(UIColor*)fillColor;

+ (UIImage *)blurryImage:(UIImage *)image
           withBlurLevel:(CGFloat)blur;

+(void)setExtraCellLineHidden: (UITableView *)tableView;

+ (UIImage*) createImageWithColor:(UIColor*) color;

+ (UIViewController *)getCurrentVC;

+(NSString *)uuidString;
+(NSString *)makeDiskDocumentPath:(NSString*)fullNamespace;

+(NSString *)makeDiskCachePath:(NSString*)fullNamespace;

+ (UIImage*)creatBackgroundLine:(CGRect)rect fillColor:(UIColor*)fillColor;

+ (UIImage *)imageByApplyingAlpha:(CGFloat)alpha  image:(UIImage*)image;

+ (UIImage *)imageWithColor:(UIColor *)color;


+ (UIImage*)creatCircleWithSize:(CGSize)size color:(UIColor*)color;

+ (BOOL)isSupportStock:(NSString*)prodCode;

+ (UIViewController *)appRootViewController;

+ (UIImage*)creatBackgroundTopLine:(CGRect)rect fillColor:(UIColor*)fillColor;
+ (UIImage*)creatBackgroundBottomLine:(CGRect)rect fillColor:(UIColor*)fillColor;
+ (UIImage*)creatBackground:(CGRect)rect fillColor:(UIColor*)fillColor lineColor:(UIColor*)lineColor;

+ (UIImageView*)creatGifImageView:(NSString*)fileName;

+ (BOOL) isResponseValid:(NSDictionary*)dict;
+ (NSInteger) fetchStatu:(NSDictionary*)dict;
+ (NSArray*) fetchArrayData:(NSDictionary*)dict;
+ (NSDictionary*) fetchNSDictionaryData:(NSDictionary*)dict;
+(NSString *)md5HexDigest:(NSString*)Des_str;

+(UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;

extern float allSizeAdapt(float i4s,float i5,float i6,float i6p);


/**
 * 获取label字体size
 */
+(CGSize)boundingRectWithSize:(CGSize)size AndeFont:(UIFont *)font Str:(NSString *)text;
//创建label获取size
+(CGSize)boundinglabelRectWithSize:(CGSize)size AndeFont:(UIFont *)font Str:(NSString *)text;
/**
 * 判断字符串是否有表情Emoji
 */
+ (BOOL)stringContainsEmoji:(NSString *)string;
/**
 * 身份证正则验证YES为正确
 */
+ (BOOL)accurateVerifyIDCardNumber:(NSString *)value;
/*
 * 将一个 view 进行截图
 */
-(UIImage *)snapImageForView:(UIView *)view;
/**
 * 电话号码隐藏
 */
+ (NSString *)hidePhoto:(NSString *)photo;


+ (NSAttributedString*)generalAttrStringFrom:(NSString*)targetString withColor:(UIColor*)color withFont:(UIFont*)font;
//json字符串转字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
/**
 *  手机号码验证
 *
 *  @param mobileNumbel 传入的手机号码
 *
 *  @return 格式正确返回true  错误 返回fals
 */
+ (BOOL) isMobile:(NSString *)mobileNumbel;

/**
 *  缓存搜索词
 */
+ (void)preservationSearchText:(NSString *)searchText;
//获取正确的window，用来弹出全屏弹框
+ (UIWindow *)lastWindow;
/**
 *  获取URL的指定参数对应值
 *
 *  
 */
+ (NSString *) paramValueOfUrl:(NSString *) url withParam:(NSString *) param;
/**
 *  验证昵称内是否有手机号
 */
+ (BOOL)queryPhoneNumber:(NSString *)phoneNum;
@end














