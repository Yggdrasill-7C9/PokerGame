//
//  AppStyle.h
//  SuperApp
//
//  Created by yujingjie on 15/4/7.
//  Copyright (c) 2015年 yujingjie. All rights reserved.
//
#import "AppMacros.h"
#import "JKUtil.h"

#ifndef SuperApp_AppStyle_h
#define SuperApp_AppStyle_h

#define GLOBAL_BODYVIEW_BG_COLOR                 RGBCOLOR(31,29,33)
#define GLOBAL_XLARGE_PROGRESS_SIZE              220
#define GLOBAL_LARGE_PROGRESS_SIZE               150
#define GLOBAL_NORMAL_PROGRESS_SIZE              140
#define GLOBAL_SMALL_PROGRESS_SIZE               130

#define navbgcolor [JKUtil getColor:@"3399FF"]
/**
 * 显示我的里面小红点通知
 */
#define Show_MyRedSport @"Show_MyRedSport"
/**
 * 隐藏我的里面小红点通知
 */
#define Hide_MyRedSport @"Hide_MyRedSport"
//行情
#define RowHeight 44
#define kSectionHeaderHeight (IS_IPHONE_6P ? 32:27)
#define sectionbgcolor RGBCOLOR(242, 242, 242)
#define sectiontitlefont [UIFont systemFontOfSize:14]
#define sectiontitlecolor RGBCOLOR(102, 102, 102)
#define marginnameandcode 4 //名称与代码距离

//涨跌背景颜色
#define UP_datacolor RGBCOLOR(255, 78, 86)
#define DOWN_datacolor RGBCOLOR(47, 186, 128)
#define NORMAL_datacolor RGBCOLOR(179, 179, 179)
#define UP_bgcolor  RGBCOLOR(255, 78, 86)
#define DOWN_bgcolor RGBCOLOR(47, 186, 128)
#define NORMAL_bgcolor RGBCOLOR(179, 179, 179)

#define darkGrayStringColor [JKUtil getColor:@"333333"]
#define grayStringColor [JKUtil getColor:@"666666"]
#define lightGrayStringColor [JKUtil getColor:@"999999"]
#define separatorLineColor [JKUtil getColor:@"e8e8e8"]
#define normalfont (IS_IPHONE_6P ?[UIFont systemFontOfSize:16]:[UIFont systemFontOfSize:16])
#define stockNoralFontSize (IS_IPHONE_6P ? 14.0f: 11.0f)
#define stockSegmentFont   (IS_IPHONE_6P ? 16.0f: 14.0f)
#define stockSegmentHeight (IS_IPHONE_6P ? 40.0f: 30.0f)
#define stockTitletFont   (IS_IPHONE_6P ? 16.0f: 14.0f)

#define stocknamecolor RGBCOLOR(0, 0, 0)
#define stockcodecolor RGBCOLOR(102, 102, 102)
#define stocknamefont [UIFont systemFontOfSize:15]
#define stockcodefont [UIFont systemFontOfSize:11]
#define datafont [UIFont systemFontOfSize:18]

#define UP_COLOR RGBCOLOR(255,78,86)
#define DOWN_COLOR RGBCOLOR(46,186,128)
#define SAME_COLOR RGBCOLOR(179,179,179)
#define TIMELINE_NORMAL_TEXT_COLOR RGBCOLOR(118,119,120)
#define AccountBgColor RGBCOLOR(214, 214, 214)

#define titleFontSize (IS_IPHONE_6P ? 20.0f : 18.0f)
#define titleColor [UIColor whiteColor]

#endif
