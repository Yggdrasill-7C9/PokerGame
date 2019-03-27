//
//  AppMacros.h
//  代码宏定义
//  Created by apple on 13-3-7.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//
#import "Tool.h"


//应用委托
#define kAppDelegate        ((AppDelegate *)[UIApplication sharedApplication].delegate)

//设备相关
#define isIPad              (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define isIPhone            (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define isIP5Screen         ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136),[[UIScreen mainScreen] currentMode].size) : NO)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (isIPhone && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (isIPhone && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (isIPhone && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (isIPhone && SCREEN_MAX_LENGTH == 736.0)

//系统版本和语言
#define IOS7_OR_LATER       ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending)
#define kSystemVersion      ([[UIDevice currentDevice] systemVersion])
#define kCurrentLanguage    ([[NSLocale preferredLanguages] objectAtIndex:0])

//应用名称和版本
#define kAPPName            [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define kAPPVersion         [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#define kScale [[UIScreen mainScreen] scale]

//appStore相关
#define kAPPCommentUrl       @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%d"
#define kAPPCommentUrl_IOS7  @"itms-apps://itunes.apple.com/app/id%d"
#define kAPPUpdateUrl        @"http://itunes.apple.com/lookup?id=%d"

#define SYSTEM_VERSION        [[[UIDevice currentDevice] systemVersion] floatValue]

//设备屏幕尺寸
#define kScreenWidth        ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight       ([UIScreen mainScreen].bounds.size.height)

#define STATUSBAR_HEIGHT      [[UIApplication sharedApplication] statusBarFrame].size.height
#define NAVBAR_HEIGHT         (44.f + ((SYSTEM_VERSION >= 7) ? STATUSBAR_HEIGHT : 0))
#define FULL_WIDTH            SCREEN_WIDTH
#define FULL_HEIGHT           (SCREEN_HEIGHT - ((SYSTEM_VERSION >= 7) ? 0 : STATUSBAR_HEIGHT))
#define CONTENT_HEIGHT        (FULL_HEIGHT - NAVBAR_HEIGHT)
// 屏幕高度
#define VIEW_HEIGHT           self.view.bounds.size.height
// 屏幕宽度
#define VIEW_WIDTH            self.view.bounds.size.width
//工具栏高度
#define TABBAR_HEIGHT self.tabBarController.tabBar.frame.size.height

//度弧度转换
#define kDegreesToRadian(x)         (M_PI * (x) / 180.0)
#define kRadianToDegrees(radian)    (radian*180.0) / (M_PI)

//Block self
#define WEAKSELF    __weak          typeof(self)  weakSelf = self;
#define STRONGSELF  __strong        typeof(weakSelf) strongSelf = weakSelf;

//GCD
#define kGCDBackground(block)       dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), (block))
#define kGCDMain(block)             dispatch_async(dispatch_get_main_queue(),(block))

//颜色
#define RGBCOLOR(r,g,b)             [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a)          [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define HEXCOLOR(c) [UIColor colorWithRed:((c>>24)&0xFF)/255.0 green:((c>>16)&0xFF)/255.0blue:((c>>8)&0xFF)/255.0 alpha:((c)&0xFF)/255.0];
#define LIME_COLOR [[UIColor alloc] initWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:1]
//安全释放
#define MM_RELEASE_SAFELY(__POINTER) {  [__POINTER release]; __POINTER = nil; }

//计时器
#define MM_INVALIDATE_TIMER(__TIMER) { [__TIMER invalidate]; __TIMER = nil; }


//以tag读取View
#define kViewByTag(parentView, tag, Class)  (Class *)[parentView viewWithTag:tag]

//读取Xib文件的类
#define kViewByNib(Class, owner, index) [[[NSBundle mainBundle] loadNibNamed:Class owner:owner options:nil] objectAtIndex:index]

//单例
#undef	AS_SINGLETON
#define AS_SINGLETON( __class ) \
        + (__class *)sharedInstance;

#undef	DEF_SINGLETON
#define DEF_SINGLETON( __class ) \
        + (__class *)sharedInstance \
        { \
            static dispatch_once_t once; \
            static __class * __singleton__; \
            dispatch_once( &once, ^{ __singleton__ = [[__class alloc] init]; } ); \
            return __singleton__; \
        }


//适配
#undef ALL_SIZEADAPT
#define ALL_SIZEADAPT(i4s,i5,i6,i6p) \
allSizeAdapt(i4s,i5,i6,i6p)




