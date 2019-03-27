//
//  BeiSuBackgroundView.m
//  PokersGame
//
//  Copyright © 2017年 liu. All rights reserved.
//

#import "BeiSuBackgroundView.h"
#import "View+MASAdditions.h"
@interface BeiSuBackgroundView ()
@property (nonatomic) UIButton *firstBut;
@property (nonatomic) UIButton *secondBut;
@property (nonatomic) UIButton *thirBut;
@end
@implementation BeiSuBackgroundView
-(instancetype)init{
    if (self = [super init]) {
        [self initViews];
    }
    return self;
}
- (void)initViews{

    
    __weak BeiSuBackgroundView *weakSelf = self;
    _secondBut = [[UIButton alloc] init];
    _secondBut.tag = 99 + 1;
    [_secondBut addTarget:self action:@selector(didSelect:) forControlEvents:UIControlEventTouchUpInside];
    [_secondBut setBackgroundImage:[UIImage imageNamed:@"green_button"] forState:UIControlStateNormal];
    [_secondBut setTitle:@"二倍" forState:UIControlStateNormal];
    _secondBut.titleLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_secondBut];
    [_secondBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(weakSelf);
        make.width.equalTo(@(BeiBUTTON_WIDTH));
        make.height.equalTo(@(BeiBUTTON_HEIGHT));
    }];
    
    _firstBut = [[UIButton alloc] init];
    _firstBut.tag = 99 + 0;
    [_firstBut addTarget:self action:@selector(didSelect:) forControlEvents:UIControlEventTouchUpInside];
    [_firstBut setBackgroundImage:[UIImage imageNamed:@"green_button"] forState:UIControlStateNormal];
    [_firstBut setTitle:@"一倍" forState:UIControlStateNormal];
    _firstBut.titleLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_firstBut];
    [_firstBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakSelf).offset(10);
        make.centerY.equalTo(_secondBut);
        make.width.equalTo(@(BeiBUTTON_WIDTH));
        make.height.equalTo(@(BeiBUTTON_HEIGHT));
    }];
    
    _thirBut = [[UIButton alloc] init];
    _thirBut.tag = 99 + 2;
    [_thirBut addTarget:self action:@selector(didSelect:) forControlEvents:UIControlEventTouchUpInside];
    [_thirBut setBackgroundImage:[UIImage imageNamed:@"green_button"] forState:UIControlStateNormal];
    [_thirBut setTitle:@"三倍" forState:UIControlStateNormal];
    _thirBut.titleLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_thirBut];
    [_thirBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(weakSelf).offset(-10);
        make.centerY.equalTo(_secondBut);
        make.width.equalTo(@(BeiBUTTON_WIDTH));
        make.height.equalTo(@(BeiBUTTON_HEIGHT));
    }];
}
- (void)didSelect:(UIButton *)sender{
    if (_didSelectBut) {
        _didSelectBut(sender.tag - 99);
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
