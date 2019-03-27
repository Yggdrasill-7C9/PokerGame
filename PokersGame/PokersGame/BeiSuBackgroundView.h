//
//  BeiSuBackgroundView.h
//  PokersGame
//
//  Copyright © 2017年 liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#define BeiBUTTON_WIDTH 50
#define BeiBUTTON_HEIGHT 35
@interface BeiSuBackgroundView : UIView
@property (nonatomic ,copy) void(^didSelectBut)(NSInteger tag);
@end
