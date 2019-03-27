//
//  PlayerModel.h
//  PokersGame
//
//  Copyright © 2017年 liu. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface PlayerModel : NSObject
@property (nonatomic, assign) BOOL isDizu;
@property (nonatomic) NSMutableArray<NSNumber *> *pokerArr;
@property (nonatomic) NSMutableArray<UIImageView *> *pokerImgViewArr;
@property (nonatomic  ) NSInteger moneyNum;
@property (nonatomic  ) NSString *nickName;
@property (nonatomic) NSInteger jiabeiNum;//筹码加倍数
@property (nonatomic) NSInteger pokersPai;//牌面大小
@end
