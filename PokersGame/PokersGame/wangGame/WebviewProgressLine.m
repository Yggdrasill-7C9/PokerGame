//
//  WebviewProgressLine.m
//  Soil3DNote
//
//  Copyright © 2017年 liu. All rights reserved.
//

#import "WebviewProgressLine.h"
#import "AppMacros.h"
@implementation WebviewProgressLine

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = YES;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)setLineColor:(UIColor *)lineColor{
    _lineColor = lineColor;
    self.backgroundColor = lineColor;
}

-(void)startLoadingAnimation{
    self.hidden = NO;
    CGRect rect = self.frame;
    rect.size.width = 0.0;
    self.frame = rect;
    
    __weak UIView *weakSelf = self;
    [UIView animateWithDuration:0.4 animations:^{
        CGRect rect = weakSelf.frame;
        rect.size.width = SCREEN_WIDTH * 0.6;
        weakSelf.frame = rect;
//        weakSelf.width = KScreenWidth * 0.6;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.4 animations:^{
            CGRect rect = weakSelf.frame;
            rect.size.width = SCREEN_WIDTH * 0.8;
            weakSelf.frame = rect;
//            weakSelf.width = SCREEN_WIDTH * 0.8;
        }];
    }];
    
    
}

-(void)endLoadingAnimation{
    __weak UIView *weakSelf = self;
    [UIView animateWithDuration:0.2 animations:^{
        CGRect rect = weakSelf.frame;
        rect.size.width = SCREEN_WIDTH;
        weakSelf.frame = rect;
//        weakSelf.width = SCREEN_WIDTH;
    } completion:^(BOOL finished) {
        weakSelf.hidden = YES;
    }];
}
@end
