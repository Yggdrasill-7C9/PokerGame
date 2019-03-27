//
//  GlobalVariable.h
//  IphoneApp
//
//  Created by zhangwen on 14/12/3.
//  Copyright (c) 2014年 apple. All rights reserved.
//

//开发时使用
#define APPDEBUG false//测试版是true 正式版是false

#define MAIN_COLOR [UIColor colorWithRed:254/255.0 green:208/255.0 blue:0/255.0 alpha:1.0]

#define objectOrNull(obj) ((obj) ? (obj) : [NSNull null])
#define objectOrEmptyStr(obj) ((obj) ? (obj) : @"")

#define isNull(x)             (!x || [x isKindOfClass:[NSNull class]])
#define toInt(x)              (isNull(x) ? 0 : [x intValue])
#define isEmptyString(x)      (isNull(x) || [x isEqual:@""] || [x isEqual:@"(null)"])

#define sleep(s);             [NSThread sleepForTimeInterval:s];
#define Syn(x)                @synthesize x = _##x

#define BoldSystemFont(size)  [UIFont boldSystemFontOfSize:size]
#define systemFont(size)      [UIFont systemFontOfSize:size]
#define beginAutoPool         NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init]; {
#define endAutoPool           } [pool release];
#define skipspace(c)          while (isspace(*c)) ++c
#define skipUntil(c,x)        while (x != *c) ++c
#define TheWindowHeight      ([UIDevice isAfterOS7] ? [UIScreen mainScreen].bounds.size.height : ([UIScreen mainScreen].bounds.size.height - 20))
#define IntToNumber(int)        ([NSNumber numberWithInt:int])
#define isIOS7 [[UIDevice currentDevice].systemVersion doubleValue]>=7.0?YES:NO

#define PhotosMessageDir ([[NSString documentPath] stringByAppendingPathComponent:@"/PhotosMessageDir/"])
#define IPHONE4 ( [ [ UIScreen mainScreen ] bounds ].size.height == 480 )
//字体颜色
#define GRAYCOLOR RGB(137, 139, 144)

#define FileManager     ([NSFileManager defaultManager])
#define TheUserDefaults ([NSUserDefaults standardUserDefaults])

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

#undef NSAssert
#define NSAssert(condition, frmt, ...) \
do { \
@try { \
if (!(condition)) { \
NSString *text = @"Assert Exception: "; \
text = [text stringByAppendingFormat:frmt, ##__VA_ARGS__]; \
NSLog(@"%@", text); \
[NSException raise:nil format:nil]; \
} \
} \
@catch (NSException *exception) {} \
} while (0);
#define LogBreakpoint(frmt, ...)    NSAssert(NO, frmt, ##__VA_ARGS__)

typedef void(^BaseBlock)(void);
typedef void(^BaseBlockWithString)(NSString *);

#import <Foundation/Foundation.h>
@interface GlobalVariable : NSObject
+(NSArray *)getCountrisArray;
@end

//长度单位转换值
#define kMilePerKM 0.62 //1千米=0.62英里
#define kKMPerMile 1609 //1英里=1609米

#define StepDetailGoalColor [UIColor colorWithRed:0.165f green:0.612f blue:0.341f alpha:1.00f]
#define DistDetailGoalColor [UIColor colorWithRed:0.969f green:0.663f blue:0.173f alpha:1.00f]
#define CalsDetailGoalColor [UIColor colorWithRed:0.914f green:0.373f blue:0.169f alpha:1.00f]
#define SleepDetailGoalColor [UIColor colorWithRed:0.427f green:0.325f blue:0.588f alpha:1.00f]

#define CHARTVIEW_COLOR_13 RGB(153,58,57)
#define CHARTVIEW_COLOR_23 RGB(63,89,150)
#define CHARTVIEW_COLOR_33 RGB(22,160,100)

//服务器地址 测试环境接口 120.76.156.87:8080,正式环境 120.25.151.49:8080
#if APPDEBUG
#define kHostName @"http://120.76.156.87:8080/PawnChat/"
#else
#define kHostName @"http://120.25.151.49:8080/PawnChat/"
#endif

//url使用接口正式版ddq.chaddq.com:8080测试版demo.chaddq.com:8080
#if APPDEBUG
#define Interface @"demo.chaddq.com:8080"
#else
#define Interface @"ddq.chaddq.com:8080"
#endif

//#define kHostName @"https://120.24.77.90/PawnChat/" //https测试服务器
//区分辽宁典当圈与典当圈字段systemType @"0"为典当圈 @“1”为辽宁典当圈
#define SYSTEM_TYPE @"0"

#define Deal_Group_Number 5

#define kSessionKey @"jsessionId"
#define kSessionTimeKey @"sessionTimeout"

/******通知相关******/
//登陆状态改变通知名称
#define kLoginStateChangeNotification @"loginStateChange"
//刷新朋友圈数据通知名称
#define kRefreshFriendsDataSourceNotification @"refreshFriendsDataSource"
//刷新评论数据通知名称
//#define kRefreshCommentsDataSourceNotification @"refreshCommentsDataSource"

#define kDeleteMyStatusDataNotifaction @"deletemystatusneedrefreshfriendsstatus"

#define kPublishNewStatusNotification @"publishnewstatus"
/*****************支付宝回调appScheme********************/
#define AppSchemeBundleID @"com.jihertech.diandangquan" //典当圈是com.jihertech.diandangquan辽宁典当圈是com.jihertech.LiaoNingdiandangquan
//微信支付通知（微信回调结果---实际结果需要与后台结果对照）
#define kWXPayresult @"wxpayresult"
//更改用户名
#define kChangeUserNameNotification @"usernameChange"
//成功登陆 --用于获取用户信息
#define kLoginSuccessNotification @"userLoginSuccess"
#define kLoginOutNotification @"userLoginOut"
#define kStatuLastUpdateTime @"kStatuLastUpdateTime"

//联系人通知
//好友请求变化时，更新好友请求未处理的个数
#define kContactsReloadApplyViewNotification @"contactsReloadApplyView"
//好友个数变化时，重新获取数据
#define kContactsReloadDataSourceNotification @"contactsReloadDataSource"
//好友申请通知
//#define kaddNewApplyNotification @"addNewApply"
//未读取的申请消息数目
#define kSetupUntreatedApplyCountNotification  @"setupUntreatedApplyCount"
#define kclearApplyNotification @"clearApply"

#define kGoodsListChangeNotification @"goodsListChangeNotificatio"

/******环信SDK相关******/
#if APPDEBUG
#define kEasemobAppKey @"jihertech888#diandangquandemo"
#else
#define kEasemobAppKey @"jihertech888#diandangquan"
#endif
#define kEasemobCustomerName @"lbh3zyi"//环信客服名称
#define KNOTIFICATION_CUSTOMER_CHAT @"customerChat"
#define kpreSale @"preSale"
#define kafterSale @"afterSale"
//Ext keyWord
#define kMesssageExtWeChat @"weichat"

//推送证书
#if APPDEBUG
#define kApnsCertName @"diandangquan_developerPush"
#else
#define kApnsCertName @"PawnChat_NewServices"
#endif
/**********环信测试SDK相关内容**********/
//#define kEasemobAppKey_test @"jihertech888#diandangquandemo"
////推送证书
//#if APPDEBUG
//#define kApnsCertName_test @"diandangquan_developerPush"
//#else
//#define kApnsCertName_test @"diandangquan_ServicePush"
//#endif

/******社会化分享AppKey、AppSecret相关******/
//shareSDK
#define kShareSDKAppKey @"bda60fd417d6"
//新浪微博
#define kSinaWeiboAppKey @"2426183414"
#define kSinaWeiboAppSecret @"807eb11ffd280b619f6147c1a27d7221"
#define kSinaWeiboRedirectUrl @"http://www.yifalicai.com"
//
//#define kWXAppID  @"wx5f0ebd41bdb812ed"

////#define Share_kWXAppKey @"wx4f4850765f1e285f"
//#define Share_kWXAppKey @"wx693a0af6814ea02c"
/**********辽宁典当圈微信**********/
#define LN_WeiXin_kWXAppKey @"wx693a0af6814ea02c"
#define LN_WeiXin_kWXAppSecret @"66239b323497d83c7bbe373152a74389"
/**********典当圈微信**********/
#define WeiXin_kWXAppKey @"wxa32b360d3b8e8615"
#define WeiXin_kWXAppSecret @"c94382c29a9f18559673d81336d2237a"
//友盟分享
//#define kWXAppKey @"wx693a0af6814ea02c"
//#define kWXAppSecret @"66239b323497d83c7bbe373152a74389"

//分享链接后缀是否加&demo=1加则是测试版
#if APPDEBUG
#define kwAppTestDome @"&demo=1"
#else
#define kwAppTestDome @"&demo=0"
#endif

#define URL_STYLY @"&style=1" //辽宁典当圈url后加&style=1
//正式版home测试版homedemo
#if APPDEBUG
#define URL_HOME @"homedemo"
#else
#define URL_HOME @"home"
#endif
//QQ
#define kQQAppKey @"1104872443"
#define kQQAppSecret @"Qkr5RKdRqV027jgn"

/******缓存相关******/

#define kDatabaseSubDirectory @"JiHer"
#define kDatabaseFilename @"JiHer.db"

//朋友圈缓存
#define kFriendsCacheDirectory @"FriendsCache"
#define kFriendsCacheFileName @"friendsStatuses.data"
#define kMyCacheFileName @"myStatuses.data"

//bugly
#define kBuglyAppId @"900010523"

//百度语音
#define kBDTTAppID @"7327583"
#define kBDTTApiKey @"EnixGktBonXIUNuVkuqBjNYY"
#define kBDTTApiSecreKey @"944c30c15c9eda2ef879cf46cfcafbcb"

//信鸽推送
#define kXGAccessId  2200170079
#define kXGAccessKey @"I788D7EGQ5MW"
#define kXGSecretKey @"4f6b915bdfcb9bdba09de7a30c967faf"

//友盟统计
#define kUmengAppID @"57fef104e0f55ad14c001d61"
//#define kUmengAppID @"566e2e7de0f55aae7c0003a6"
/**********辽宁典当圈极光推送**********/
#define LN_JGuanAppID @"370adef5b59d300892caeac2"
#define LN_JGuanChannel  @"Publish channel"
//生产环境为true 开发环境为FALSE
#if APPDEBUG
#define LN_JGuanProduction FALSE
#else
#define LN_JGuanProduction true
#endif
/**********典当圈极光推送**********/
#define JGuanAppID @"5b75e083876ce83251804417"
#define JGuanChannel  @"Publish channel"
//生产环境为true 开发环境为FALSE
#if APPDEBUG
#define JGuanProduction FALSE
#else
#define JGuanProduction true
#endif

//语音识别文件
#define kStocklistVersionKey @"kStocklistVersionKey"
#define kSecidVersionKey @"kSecidVersionKey"


//拍卖出价刷新通知
#define AUCTION_PRICE_RELOAD @"AuctionPriceReload"
//Bugly崩溃记录
/************辽宁典当圈Bugly*****************/
#define LN_BuglyAppId @"c129755dda"
#define LN_BuglyAppKey @"ef1361ae-28b5-4788-a4f2-2eaa8943811e"
/************典当圈Bugly*****************/
#define BuglyAppId @"5255288e65"
#define BuglyAppKey @"e1d8f3b6-a850-4c1b-b8a5-e29c7990230b"
//保存用户登录首页次数
#define UserJumpHomePageNum @"UserJumpHomePageNum"

//用户历史搜索记录
#define SEARCHPRICE @"historyRecord"
#define HISTORY_SEARCHCOUNT 20//搜索次缓存数量

//保存密码
#define SAVE_PASSWORD @"SAVEPASSWORD"
