//
//  AlertView.h
//  PokersGame
//
//  Copyright © 2017年 liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertView : UIView
@property (nonatomic ,copy) void(^didSelect)(void);
- (void)alertText:(NSString *)text;
@end
