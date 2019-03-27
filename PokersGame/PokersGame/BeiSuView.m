

//
//  BeiSuView.m
//  PokersGame
//
//  Copyright © 2017年 liu. All rights reserved.
//

#import "BeiSuView.h"
#import "View+MASAdditions.h"
#import "AppMacros.h"
@interface BeiSuView()
@property (nonatomic) UIImageView *numberView;
@property (nonatomic) UIImageView *image_1;
@property (nonatomic) UIImageView *image_2;

@end
@implementation BeiSuView
-(instancetype)init{
    if (self = [super init]) {
        [self addView];
    }
    return self;
}
- (void)addView{
    _image_1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [self addSubview:_image_1];
    _numberView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 0, 15, 20)];
    [self addSubview:_numberView];
    _image_2 = [[UIImageView alloc] initWithFrame:CGRectMake(35, 0, 20, 20)];
    [self addSubview:_image_2];
    
}
- (void)editingBeiSu:(NSInteger)num{
    _image_2.image = [UIImage imageNamed:@"倍字"];
    _image_1.image = [UIImage imageNamed:@"乘号"];
    switch (num) {
        case 0:
            _numberView.image = [UIImage imageNamed:@"一倍"];
            break;
        case 1:
            _numberView.image = [UIImage imageNamed:@"二倍"];
            break;
        case 2:
            _numberView.image = [UIImage imageNamed:@"三倍"];
            break;
        case 3:
            _numberView.image = [UIImage imageNamed:@"三倍"];
            break;
            
        default:
            break;
    }
}
- (void)clearBeiSu{
    _image_2.image = [UIImage imageNamed:@""];
    _image_1.image = [UIImage imageNamed:@""];
    _numberView.image = [UIImage imageNamed:@""];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
