//
//  AlertView.m
//  PokersGame
//
//  Copyright © 2017年 liu. All rights reserved.
//

#import "AlertView.h"
#import "View+MASAdditions.h"
#import "AppMacros.h"
#import "JKUtil.h"
@interface AlertView()
@property (nonatomic) UILabel *context;
@end
@implementation AlertView
-(instancetype)init{
    if (self = [super init]) {
        [self addView];
    }
    return self;
}
- (void)addView{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    view.userInteractionEnabled = NO;
    [self addSubview:view];
    
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"latter"]];
    [self addSubview:img];
    [img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self);
        make.height.equalTo(@(200));
        make.width.equalTo(@(200));
    }];
    
    _context = [[UILabel alloc] init];
    _context.textColor = [JKUtil getColor:@"ff6400"];
    _context.font = [UIFont systemFontOfSize:18];
    _context.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_context];
    [_context mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.top.equalTo(img);
        make.height.equalTo(@(170));
    }];
    
    UIButton *but = [[UIButton alloc] init];
    [but setTitle:@"继续" forState:UIControlStateNormal];
    [but addTarget:self action:@selector(didSelectBut) forControlEvents:UIControlEventTouchUpInside];
    [but setBackgroundImage:[UIImage imageNamed:@"editbox_btn.9"] forState:UIControlStateNormal];
    [self addSubview:but];
    [but mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(img);
        make.bottom.equalTo(_context.mas_bottom);
        make.width.equalTo(@(60));
        make.height.equalTo(@(30));
    }];
    
}
- (void)didSelectBut{
    if (_didSelect) {
        _didSelect();
    }
}
-(void)alertText:(NSString *)text{
    _context.text = text;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
