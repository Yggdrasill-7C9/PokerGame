//
//  GameViewController.m
//  PokersGame
//
//  Copyright © 2017年 liu. All rights reserved.
//

#import "GameViewController.h"
#import "View+MASAdditions.h"
#import <AVFoundation/AVFoundation.h>
#import "PlayerModel.h"
#import "BeiSuBackgroundView.h"
#import "BeiSuView.h"
#import "AlertView.h"
#import "WebDetailViewController.h"
static CGFloat pokersHeight = 80;
static CGFloat pokersWidth = 50;
static CGFloat pokersHeight_Rest = 64;
static CGFloat pokersWidth_Rest = 40;
@interface GameViewController ()
@property (nonatomic) PlayerModel *guke_1;
@property (nonatomic) PlayerModel *guke_2;
@property (nonatomic) PlayerModel *guke_3;
@property (nonatomic) PlayerModel *guke_4;
@property (nonatomic) PlayerModel *guke_5;

@property (nonatomic) NSArray<NSString *> *pokers;
@property (weak, nonatomic) IBOutlet UIView *iconBackfroud_1;
@property (weak, nonatomic) IBOutlet UIView *iconBackfroud_2;
@property (weak, nonatomic) IBOutlet UIView *iconBackgroud_3;
@property (weak, nonatomic) IBOutlet UIView *iconBackgroud_4;
@property (weak, nonatomic) IBOutlet UIView *iconBackgroud_5;
@property (weak, nonatomic) IBOutlet UIButton *functionBut;

@property (weak, nonatomic) IBOutlet UILabel *Money_1;
@property (weak, nonatomic) IBOutlet UILabel *money_2;
@property (weak, nonatomic) IBOutlet UILabel *money_3;
@property (weak, nonatomic) IBOutlet UILabel *money_4;
@property (weak, nonatomic) IBOutlet UILabel *money_5;
@property (nonatomic) PlayerModel *zhuangjia;
@property(nonatomic) UIImageView *paimianImg_1;
@property(nonatomic) UIImageView *paimianImg_2;
@property(nonatomic) UIImageView *paimianImg_3;
@property(nonatomic) UIImageView *paimianImg_4;
@property(nonatomic) UIImageView *paimianImg_5;

@property (nonatomic) BeiSuView *bei_1;
@property (nonatomic) BeiSuView *bei_2;
@property (nonatomic) BeiSuView *bei_3;
@property (nonatomic) BeiSuView *bei_4;
@property (nonatomic) BeiSuView *bei_5;
@property (nonatomic) BOOL isFapai;//发牌时候
@property (nonatomic) AlertView *xianAlert;
@property (nonatomic) UIImageView *chuangImageView;
@property (nonatomic) UILabel *contest;//说明label；
@property (nonatomic) UILabel *jiaBeiContest;//加倍说明label
@property (nonatomic) NSTimer *jiaBeiTime;
@property (nonatomic) BeiSuBackgroundView *beiView;
@property (nonatomic, retain)AVAudioPlayer *musicPlayer;
@property (nonatomic) NSTimer *countTimer;
@property (nonatomic) NSInteger countDownNum;
@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isFapai = NO;
    // Do any additional setup after loading the view from its nib.
    _guke_1 = [[PlayerModel alloc] init];
    _guke_1.nickName = @"Player";
    _guke_2 = [[PlayerModel alloc] init];
    _guke_2.nickName = @"Ruby";
    _guke_3 = [[PlayerModel alloc] init];
    _guke_3.nickName = @"Austen";
    _guke_4 = [[PlayerModel alloc] init];
    _guke_4.nickName = @"Rucker";
    _guke_5 = [[PlayerModel alloc] init];
    _guke_5.nickName = @"Ruth";

    _pokers= @[
                     @"a1.jpg",@"a2.jpg",@"a3.jpg",@"a4.jpg",@"a5.jpg",@"a6.jpg",@"a7.jpg",@"a8.jpg",@"a9.jpg",@"a10.jpg",@"a11.jpg",@"a12.jpg",@"a13.jpg",
                     @"b1.jpg",@"b2.jpg",@"b3.jpg",@"b4.jpg",@"b5.jpg",@"b6.jpg",@"b7.jpg",@"b8.jpg",@"b9.jpg",@"b10.jpg",@"b11.jpg",@"b12.jpg",@"b13.jpg",
                     @"c1.jpg",@"c2.jpg",@"c3.jpg",@"c4.jpg",@"c5.jpg",@"c6.jpg",@"c7.jpg",@"c8.jpg",@"c9.jpg",@"c10.jpg",@"c11.jpg",@"c12.jpg",@"c13.jpg",
                     @"d1.jpg",@"d2.jpg",@"d3.jpg",@"d4.jpg",@"d5.jpg",@"d6.jpg",@"d7.jpg",@"d8.jpg",@"d9.jpg",@"d10.jpg",@"d11.jpg",@"d12.jpg",@"d13.jpg",];
    


    [self.musicPlayer play];
    [self adddBeiSuView];

}
- (void)adddBeiSuView{
    __weak GameViewController *weakSelf = self;
    _bei_1 = [[BeiSuView alloc] init];
    [self.view addSubview:_bei_1];
    [_bei_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakSelf.iconBackfroud_1.mas_leading);
        make.bottom.equalTo(weakSelf.iconBackfroud_1.mas_top).offset(-5);
        make.height.equalTo(@(20));
        make.width.equalTo(@(55));
    }];
    _bei_2 = [[BeiSuView alloc] init];
    [self.view addSubview:_bei_2];
    [_bei_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakSelf.iconBackfroud_2.mas_leading);
        make.bottom.equalTo(weakSelf.iconBackfroud_2.mas_top).offset(-5);
        make.height.equalTo(@(20));
        make.width.equalTo(@(55));
    }];
    _bei_3 = [[BeiSuView alloc] init];
    [self.view addSubview:_bei_3];
    [_bei_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(weakSelf.iconBackgroud_3.mas_leading).offset(-10);
        make.centerY.equalTo(weakSelf.iconBackgroud_3);
        make.height.equalTo(@(20));
        make.width.equalTo(@(55));
    }];
    _bei_4 = [[BeiSuView alloc] init];
    [self.view addSubview:_bei_4];
    [_bei_4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(weakSelf.iconBackgroud_4.mas_leading).offset(-10);
        make.centerY.equalTo(weakSelf.iconBackgroud_4);
        make.height.equalTo(@(20));
        make.width.equalTo(@(55));
    }];
    _bei_5 = [[BeiSuView alloc] init];
    [self.view addSubview:_bei_5];
    [_bei_5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(weakSelf.iconBackgroud_5.mas_trailing);
        make.bottom.equalTo(weakSelf.iconBackgroud_5.mas_top).offset(-5);
        make.height.equalTo(@(20));
        make.width.equalTo(@(55));
    }];
}
- (AVAudioPlayer *)musicPlayer{
    if (!_musicPlayer) {
        NSURL *musicUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"HaveACocktailv2" ofType:@"mp3"]];

        _musicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:musicUrl error:nil];
        _musicPlayer.numberOfLoops= -1;
        // 准备（缓冲）播放
        [_musicPlayer prepareToPlay];
    }
    return _musicPlayer;
}
- (void)fapai{
    
    for (int i = 0; i < 5; i ++ ) {
        NSInteger row = arc4random()%52;
        NSNumber *number = [NSNumber numberWithInteger:row];
        while ([_guke_1.pokerArr containsObject:number]) {
            row = arc4random()%52;
            number = [NSNumber numberWithInteger:row];
        }
        [_guke_1.pokerArr addObject:number];
    }
    for (int i = 0; i < 5; i ++ ) {
        NSInteger row = arc4random()%52;
        NSNumber *number = [NSNumber numberWithInteger:row];
        while ([_guke_1.pokerArr containsObject:number] || [_guke_2.pokerArr containsObject:number]) {
            row = arc4random()%52;
            number = [NSNumber numberWithInteger:row];
        }
        [_guke_2.pokerArr addObject:number];
    }
    
    for (int i = 0; i < 5; i ++ ) {
        NSInteger row = arc4random()%52;
        NSNumber *number = [NSNumber numberWithInteger:row];
        while ([_guke_1.pokerArr containsObject:number] || [_guke_2.pokerArr containsObject:number] || [_guke_3.pokerArr containsObject:number])  {
            row = arc4random()%52;
            number = [NSNumber numberWithInteger:row];
        }
        [_guke_3.pokerArr addObject:number];
    }
    
    for (int i = 0; i < 5; i ++ ) {
        NSInteger row = arc4random()%52;
        NSNumber *number = [NSNumber numberWithInteger:row];
        while ([_guke_1.pokerArr containsObject:number] || [_guke_2.pokerArr containsObject:number] || [_guke_3.pokerArr containsObject:number] || [_guke_4.pokerArr containsObject:number]) {
            row = arc4random()%52;
            number = [NSNumber numberWithInteger:row];
        }
        [_guke_4.pokerArr addObject:number];
    }
    
    for (int i = 0; i < 5; i ++ ) {
        NSInteger row = arc4random()%52;
        NSNumber *number = [NSNumber numberWithInteger:row];
        while ([_guke_1.pokerArr containsObject:number] || [_guke_2.pokerArr containsObject:number] || [_guke_3.pokerArr containsObject:number] || [_guke_4.pokerArr containsObject:number] || [_guke_5.pokerArr containsObject:number]) {
            row = arc4random()%52;
            number = [NSNumber numberWithInteger:row];
        }
        [_guke_5.pokerArr addObject:number];
    }
    NSLog(@"width = %@ height = %@",@(SCREEN_WIDTH),@(SCREEN_HEIGHT));
    [self imgAddView:_guke_1.pokerImgViewArr];
    [self imgAddView:_guke_2.pokerImgViewArr];
    [self imgAddView:_guke_3.pokerImgViewArr];
    [self imgAddView:_guke_4.pokerImgViewArr];
    [self imgAddView:_guke_5.pokerImgViewArr];

    [UIView animateWithDuration:1 animations:^{
        [self gukePokerFirstAnimation];
        [self gukePokerSecondAnimation];
        [self gukePokerThirdAnimation];
        [self gukeFourthAnimation];
        [self gukePokerFifthAnimation];
    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:1 animations:^{
//            self.beiView.alpha = 1;
//        }];
        [self pokerAnimation:_guke_1.pokerImgViewArr[2] imageName:_pokers[[_guke_1.pokerArr[0] integerValue]]];
        [self pokerAnimation:_guke_1.pokerImgViewArr[1] imageName:_pokers[[_guke_1.pokerArr[1] integerValue]]];
        [self pokerAnimation:_guke_1.pokerImgViewArr[0] imageName:_pokers[[_guke_1.pokerArr[2] integerValue]]];
        [self pokerAnimation:_guke_1.pokerImgViewArr[3] imageName:_pokers[[_guke_1.pokerArr[3] integerValue]]];
        self.contest.text = @"随机选庄家";
    }];
    
//    UIView *timeBackgroundView = [[UIView alloc] init];
//    timeBackgroundView.backgroundColor = [UIColor blackColor];
//    timeBackgroundView.alpha = 0.3;
//    timeBackgroundView.layer.cornerRadius = 25;
//    timeBackgroundView.layer.masksToBounds = true;
//    [self.view addSubview:timeBackgroundView];
//    [timeBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.centerX.equalTo(self.view);
//        make.width.height.equalTo(@(50));
//    }];

    
}


- (void)selectGukeDizu{
    NSInteger row = arc4random()%5;
    switch (row) {
        case 0:
        {
            _guke_1.isDizu = YES;
            [self.chuangImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(_iconBackfroud_1.mas_top).offset(5);
                make.centerX.equalTo(_iconBackfroud_1.mas_trailing).offset(-5);
                make.width.height.equalTo(@(15));
            }];
        }
            break;
        case 1:
        {
            _guke_2.isDizu = YES;
            [self.chuangImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(_iconBackfroud_2.mas_top).offset(5);
                make.centerX.equalTo(_iconBackfroud_2.mas_trailing).offset(-5);
                make.width.height.equalTo(@(15));
            }];
        }
            break;
        case 2:
        {
            _guke_3.isDizu = YES;
            [self.chuangImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(_iconBackgroud_3.mas_top).offset(5);
                make.centerX.equalTo(_iconBackgroud_3.mas_trailing).offset(-5);
                make.width.height.equalTo(@(15));
            }];
        }
            break;
        case 3:
        {
            _guke_4.isDizu = YES;
            [self.chuangImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(_iconBackgroud_4.mas_top).offset(5);
                make.centerX.equalTo(_iconBackgroud_4.mas_trailing).offset(-5);
                make.width.height.equalTo(@(15));
            }];
        }
            break;
        case 4:
        {
            _guke_5.isDizu = YES;
            [self.chuangImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(_iconBackgroud_5.mas_top).offset(5);
                make.centerX.equalTo(_iconBackgroud_5.mas_trailing).offset(-5);
                make.width.height.equalTo(@(15));
            }];
        }
            break;
        default:
            break;
    }
    
    self.jiaBeiContest.text = @"请选择下注倍数";
    [UIView animateWithDuration:0.3 animations:^{
        self.beiView.alpha = 1;
    }];
}


- (void)pokerAnimation:(UIImageView *)imgview imageName:(NSString *)imageName{
    [UIView beginAnimations:@"View Filp" context:nil];
    [UIView setAnimationDelay:0.8];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:imgview cache:NO];
    [UIView commitAnimations];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        imgview.image = [UIImage imageNamed:imageName];
    });
}

- (void)imgAddView:(NSMutableArray<UIImageView *> *)imgs{
    [imgs enumerateObjectsUsingBlock:^(UIImageView * _Nonnull imgView, NSUInteger idx, BOOL * _Nonnull stop) {
        imgView.image = [UIImage imageNamed:@"cardBackground.jpg"];
        imgView.frame = CGRectMake(SCREEN_WIDTH/2 - pokersWidth/2, SCREEN_HEIGHT/2 - pokersHeight/2, pokersWidth, pokersHeight);
        [self.view addSubview:imgView];
    }];
}
- (void)viewAddPoker:(UIView *)view gukePoker:(NSArray<UIImageView *> *)gukePoker{
    [gukePoker enumerateObjectsUsingBlock:^(UIImageView * _Nonnull imgView, NSUInteger idx, BOOL * _Nonnull stop) {
        imgView.image = [UIImage imageNamed:@"cardBackground.jpg"];
        imgView.frame = CGRectMake(15 * idx, 0, pokersWidth_Rest, pokersHeight_Rest);
        [view addSubview:imgView];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)didSelectDunction:(id)sender {
//    [self kaiPai];
    
}
- (IBAction)didMusic:(id)sender {
    UIButton *but = sender;
    but.selected = !but.selected;
    if (but.selected) {
        
        [but setImage:[UIImage imageNamed:@"音乐开"] forState:UIControlStateNormal] ;
        [self.musicPlayer stop];
    } else{
        
        [but setImage:[UIImage imageNamed:@"音乐关"] forState:UIControlStateNormal] ;
        [self.musicPlayer play];
    }

}
- (IBAction)fapaile:(id)sender {
    if (_isFapai) {
        return;
    }
    _isFapai = YES;
      [self fapai];
}

-(UILabel *)contest{
    if (!_contest) {
        _countDownNum = 5;
        _contest = [[UILabel alloc] init];
        _contest.font = [UIFont systemFontOfSize:13];
        _contest.textColor = [UIColor whiteColor];
        [self.view addSubview:_contest];
        __weak GameViewController *weakSelf = self;
        [_contest mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.centerY.equalTo(weakSelf.view);
        }];
        _countTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(onBeiCount) userInfo:nil repeats:YES];

    }
    return _contest;
}
-(UILabel *)jiaBeiContest{
    if (!_jiaBeiContest) {
        _countDownNum = 10;
        _jiaBeiContest = [[UILabel alloc] init];
        _jiaBeiContest.font = [UIFont systemFontOfSize:13];
        _jiaBeiContest.textColor = [UIColor whiteColor];
        [self.view addSubview:_jiaBeiContest];
        __weak GameViewController *weakSelf = self;
        [_jiaBeiContest mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.centerY.equalTo(weakSelf.view);
        }];
        [self rondomBeisu];

        _jiaBeiTime = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(onJiaBeiCount) userInfo:nil repeats:YES];
        
    }
    return _jiaBeiContest;
}
- (void)onJiaBeiCount{
    _countDownNum --;
    _jiaBeiContest.text = [NSString stringWithFormat:@"请选择下注倍数 %@",@(_countDownNum)];
    if (_countDownNum < 0) {
        if (_guke_1.jiabeiNum == 0) {
            [_bei_1 editingBeiSu:1];
        }
        [self kaiPai];
        [_jiaBeiContest removeFromSuperview];
        _jiaBeiContest = nil;
        [_beiView removeFromSuperview];
        _beiView = nil;
        [_jiaBeiTime invalidate];
        _jiaBeiTime = nil;
    }
}
- (void)rondomBeisu{
    _guke_2.jiabeiNum = arc4random()%3;
    _guke_3.jiabeiNum = arc4random()%3;
    _guke_4.jiabeiNum = arc4random()%3;
    _guke_5.jiabeiNum = arc4random()%3;
    __weak GameViewController *weakSelf = self;
    dispatch_time_t delayTime_1 = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0/*延迟执行时间*/ * NSEC_PER_SEC));
    
    dispatch_after(delayTime_1, dispatch_get_main_queue(), ^{
        [weakSelf.bei_2 editingBeiSu:weakSelf.guke_2.jiabeiNum];
    });
    dispatch_time_t delayTime_2 = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0/*延迟执行时间*/ * NSEC_PER_SEC));
    
    dispatch_after(delayTime_2, dispatch_get_main_queue(), ^{
        [weakSelf.bei_3 editingBeiSu:weakSelf.guke_3.jiabeiNum];
    });
    dispatch_time_t delayTime_3 = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0/*延迟执行时间*/ * NSEC_PER_SEC));
    
    dispatch_after(delayTime_3, dispatch_get_main_queue(), ^{
        [weakSelf.bei_4 editingBeiSu:weakSelf.guke_3.jiabeiNum];
    });
    dispatch_time_t delayTime_4 = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(8.0/*延迟执行时间*/ * NSEC_PER_SEC));
    
    dispatch_after(delayTime_4, dispatch_get_main_queue(), ^{
        [weakSelf.bei_5 editingBeiSu:weakSelf.guke_3.jiabeiNum];
    });
//
//    [_bei_3 editingBeiSu:_guke_3.jiabeiNum];
//    [_bei_4 editingBeiSu:_guke_4.jiabeiNum];
//    [_bei_5 editingBeiSu:_guke_5.jiabeiNum];
    
    
    
}
- (void)onBeiCount{
    _countDownNum --;
    _contest.text = [NSString stringWithFormat:@"随机选庄家 %@",@(_countDownNum)];
    if (_countDownNum < 0) {
        [_contest removeFromSuperview];
        _contest = nil;
        [_countTimer invalidate];
        _countTimer = nil;
        [self selectGukeDizu];

    }
}
- (UIImageView *)chuangImageView{
    if (!_chuangImageView) {
        _chuangImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"庄"]];
        _chuangImageView.frame = CGRectMake(0, 0, 15, 15);
        [self.view addSubview:_chuangImageView];
    }
    return _chuangImageView;
}
- (BeiSuBackgroundView *)beiView{
    if (!_beiView) {
        _beiView = [[BeiSuBackgroundView alloc] init];
        _beiView.alpha = 0;
        __weak GameViewController *weakSelf = self;
        [_beiView setDidSelectBut:^(NSInteger tag) {
            [weakSelf.bei_1 editingBeiSu:tag];
            weakSelf.guke_1.jiabeiNum = tag;
        }];
        [self.view addSubview:_beiView];
        __weak GameViewController *weakView = self;
        [_beiView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakView .view.mas_centerY).offset(20);
            make.centerX.equalTo(weakView.view);
            make.width.equalTo(@(BeiBUTTON_WIDTH * 3 + 30));
            make.height.equalTo(@(BeiBUTTON_HEIGHT));
        }];
    }
    return _beiView;
}
- (void)kaiPai{
    [self pokerAnimation:_guke_1.pokerImgViewArr[4] imageName:_pokers[[_guke_1.pokerArr[4] integerValue]]];
    
    [self pokerAnimation:_guke_2.pokerImgViewArr[0] imageName:_pokers[[_guke_2.pokerArr[0] integerValue]]];
    [self pokerAnimation:_guke_2.pokerImgViewArr[1] imageName:_pokers[[_guke_2.pokerArr[1] integerValue]]];
    [self pokerAnimation:_guke_2.pokerImgViewArr[2] imageName:_pokers[[_guke_2.pokerArr[2] integerValue]]];
    [self pokerAnimation:_guke_2.pokerImgViewArr[3] imageName:_pokers[[_guke_2.pokerArr[3] integerValue]]];
    [self pokerAnimation:_guke_2.pokerImgViewArr[4] imageName:_pokers[[_guke_2.pokerArr[4] integerValue]]];
    
    [self pokerAnimation:_guke_3.pokerImgViewArr[0] imageName:_pokers[[_guke_3.pokerArr[0] integerValue]]];
    [self pokerAnimation:_guke_3.pokerImgViewArr[1] imageName:_pokers[[_guke_3.pokerArr[1] integerValue]]];
    [self pokerAnimation:_guke_3.pokerImgViewArr[2] imageName:_pokers[[_guke_3.pokerArr[2] integerValue]]];
    [self pokerAnimation:_guke_3.pokerImgViewArr[3] imageName:_pokers[[_guke_3.pokerArr[3] integerValue]]];
    [self pokerAnimation:_guke_3.pokerImgViewArr[4] imageName:_pokers[[_guke_3.pokerArr[4] integerValue]]];
    
    [self pokerAnimation:_guke_4.pokerImgViewArr[0] imageName:_pokers[[_guke_4.pokerArr[0] integerValue]]];
    [self pokerAnimation:_guke_4.pokerImgViewArr[1] imageName:_pokers[[_guke_4.pokerArr[1] integerValue]]];
    [self pokerAnimation:_guke_4.pokerImgViewArr[2] imageName:_pokers[[_guke_4.pokerArr[2] integerValue]]];
    [self pokerAnimation:_guke_4.pokerImgViewArr[3] imageName:_pokers[[_guke_4.pokerArr[3] integerValue]]];
    [self pokerAnimation:_guke_4.pokerImgViewArr[4] imageName:_pokers[[_guke_4.pokerArr[4] integerValue]]];
    
    [self pokerAnimation:_guke_5.pokerImgViewArr[0] imageName:_pokers[[_guke_5.pokerArr[0] integerValue]]];
    [self pokerAnimation:_guke_5.pokerImgViewArr[1] imageName:_pokers[[_guke_5.pokerArr[1] integerValue]]];
    [self pokerAnimation:_guke_5.pokerImgViewArr[2] imageName:_pokers[[_guke_5.pokerArr[2] integerValue]]];
    [self pokerAnimation:_guke_5.pokerImgViewArr[3] imageName:_pokers[[_guke_5.pokerArr[3] integerValue]]];
    [self pokerAnimation:_guke_5.pokerImgViewArr[4] imageName:_pokers[[_guke_5.pokerArr[4] integerValue]]];
//    __weak GameViewController *weakSelf = self;
    dispatch_time_t delayTime_4 = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0/*延迟执行时间*/ * NSEC_PER_SEC));
    _guke_1.pokersPai = [self judgePokersPoker:self.guke_1.pokerArr];
    _guke_2.pokersPai = [self judgePokersPoker:self.guke_2.pokerArr];
    _guke_3.pokersPai = [self judgePokersPoker:self.guke_3.pokerArr];
    _guke_4.pokersPai = [self judgePokersPoker:self.guke_4.pokerArr];
    _guke_5.pokersPai = [self judgePokersPoker:self.guke_5.pokerArr];

    dispatch_after(delayTime_4, dispatch_get_main_queue(), ^{
        self.paimianImg_1.image = [self getPokerMian:self.guke_1.pokersPai];
        self.paimianImg_2.image = [self getPokerMian:self.guke_2.pokersPai];
        self.paimianImg_3.image = [self getPokerMian:self.guke_3.pokersPai];
        self.paimianImg_4.image = [self getPokerMian:self.guke_4.pokersPai];
        self.paimianImg_5.image = [self getPokerMian:self.guke_5.pokersPai];
        NSMutableArray *arr = [[NSMutableArray alloc] initWithArray:@[_guke_1,_guke_2,_guke_3,_guke_4,_guke_5]];
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"pokersPai" ascending:YES];
        //这个数组保存的是排序好的对象
        NSArray *tempArray = [arr sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
        [self tangKuangArr:tempArray];
        for (PlayerModel *model in tempArray) {
            NSLog(@"fjaljf %@  %@",model.nickName,@(model.pokersPai));
            
        }

    });


    
}

- (void)tangKuangArr:(NSArray<PlayerModel *> *)arr{
    
    if (arr[4].pokersPai != arr[3].pokersPai &&
        arr[3].pokersPai != arr[2].pokersPai &&
        arr[2].pokersPai != arr[1].pokersPai &&
        arr[1].pokersPai != arr[0].pokersPai) {
        if (arr[4].isDizu) {
            
            [self.xianAlert alertText:@"庄家通杀"];
            PlayerModel *model = [arr lastObject];
            [self.xianAlert alertText:[NSString stringWithFormat:@"%@赢",model.nickName]];
            int x = 5;
            while (x < 5) {
                arr[x].moneyNum =  arr[x].jiabeiNum * 50 + arr[x].moneyNum;
                model.moneyNum = model.moneyNum - arr[x].jiabeiNum * 50;
                x++;
            }
            int y = 3;
            while (y >= 0) {
                arr[y].moneyNum =  arr[y].moneyNum - arr[y].jiabeiNum * 50;
                model.moneyNum = model.moneyNum + arr[y].jiabeiNum * 50;
                y--;
            }
            [self zhengliMoneyWith:arr];
            [self zhengliMoneyWith:arr];
            return;
        }else{
            
            for (int i = 0; i < 5; i++) {
                PlayerModel *model = arr[i];
                if (model.isDizu) {
                    [self.xianAlert alertText:[NSString stringWithFormat:@"%@赢",arr[i].nickName]];
                    int x = i++;
                    while (x < 5) {
                         arr[x].moneyNum =  arr[x].jiabeiNum * 50 + arr[x].moneyNum;
                        arr[i].moneyNum = arr[i].moneyNum - arr[x].jiabeiNum * 50;
                        x++;
                    }
                    int y = i--;
                    while (y >= 0) {
                        arr[y].moneyNum =  arr[y].moneyNum - arr[y].jiabeiNum * 50;
                        arr[i].moneyNum = arr[i].moneyNum + arr[y].jiabeiNum * 50;
                        y--;
                    }
                    [self zhengliMoneyWith:arr];
                    return;
                }
            }
        }
    }else if(arr[4].pokersPai == arr[3].pokersPai &&
             arr[3].pokersPai == arr[2].pokersPai &&
             arr[2].pokersPai == arr[1].pokersPai &&
             arr[1].pokersPai == arr[0].pokersPai){
        
        [self.xianAlert alertText:@"相同牌，庄家赢"];
        for (int i = 0; i < 5; i++) {
            PlayerModel *model = arr[i];
            if (model.isDizu) {
                int x = i++;
                while (x < 5) {
                    arr[x].moneyNum =  arr[x].moneyNum - arr[x].jiabeiNum * 50;
                    arr[i].moneyNum = arr[i].moneyNum + arr[x].jiabeiNum * 50;
                    x++;
                }
                int y = i--;
                while (y >= 0) {
                    arr[y].moneyNum =  arr[y].moneyNum - arr[y].jiabeiNum * 50;
                    arr[i].moneyNum = arr[i].moneyNum + arr[y].jiabeiNum * 50;
                    y--;
                }
                [self zhengliMoneyWith:arr];
                return;
            }

        }
    }else{
        
        PlayerModel *model = [arr lastObject];
        [self.xianAlert alertText:[NSString stringWithFormat:@"%@赢",model.nickName]];
        int x = 5;
        while (x < 5) {
            arr[x].moneyNum =  arr[x].jiabeiNum * 50 + arr[x].moneyNum;
            model.moneyNum = model.moneyNum - arr[x].jiabeiNum * 50;
            x++;
        }
        int y = 3;
        while (y >= 0) {
            arr[y].moneyNum =  arr[y].moneyNum - arr[y].jiabeiNum * 50;
            model.moneyNum = model.moneyNum + arr[y].jiabeiNum * 50;
            y--;
        }
        [self zhengliMoneyWith:arr];
        return;
    }
    
}
- (void)zhengliMoneyWith:(NSArray<PlayerModel *> *)arr{
    
    for (PlayerModel *model in arr) {
        NSLog(@"fjjj %@",@(model.moneyNum));
        if ([model.nickName isEqualToString:@"Player"]) {
            _guke_1 = model;
            _Money_1.text = [NSString stringWithFormat:@"%@",@(_guke_1.moneyNum)];
        }else if ([model.nickName isEqualToString:@"Ruby"]){
            _guke_2 = model;
            _money_2.text = [NSString stringWithFormat:@"%@",@(_guke_2.moneyNum)];
        }else if ([model.nickName isEqualToString:@"Austen"]){
            _guke_3 = model;
            _money_3.text = [NSString stringWithFormat:@"%@",@(_guke_3.moneyNum)];
        }else if ([model.nickName isEqualToString:@"Rucker"]){
            _guke_4 = model;
            _money_4.text = [NSString stringWithFormat:@"%@",@(_guke_4.moneyNum)];
        }else if ([model.nickName isEqualToString:@"Ruth"]){
            _guke_5 = model;
            _money_5.text = [NSString stringWithFormat:@"%@",@(_guke_5.moneyNum)];
        }
    }

}
- (void)gukePokerFifthAnimation{
    __weak GameViewController *weakSelf = self;
    [_guke_5.pokerImgViewArr[0] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.iconBackgroud_5.mas_centerY);
        make.trailing.equalTo(weakSelf.iconBackgroud_5.mas_leading).offset(-15);
        make.height.equalTo(@(pokersHeight_Rest));
        make.width.equalTo(@(pokersWidth_Rest));
    }];
    [_guke_5.pokerImgViewArr[1] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.iconBackgroud_5.mas_centerY);
        make.trailing.equalTo(weakSelf.iconBackgroud_5.mas_leading).offset(-15 * 2);
        make.height.equalTo(@(pokersHeight_Rest));
        make.width.equalTo(@(pokersWidth_Rest));
    }];
    [_guke_5.pokerImgViewArr[2] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.iconBackgroud_5.mas_centerY);
        make.trailing.equalTo(weakSelf.iconBackgroud_5.mas_leading).offset(-15 * 3);
        make.height.equalTo(@(pokersHeight_Rest));
        make.width.equalTo(@(pokersWidth_Rest));
    }];
    [_guke_5.pokerImgViewArr[3] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.iconBackgroud_5.mas_centerY);
        make.trailing.equalTo(weakSelf.iconBackgroud_5.mas_leading).offset(-15 * 4);
        make.height.equalTo(@(pokersHeight_Rest));
        make.width.equalTo(@(pokersWidth_Rest));
    }];
    [_guke_5.pokerImgViewArr[4] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.iconBackgroud_5.mas_centerY);
        make.trailing.equalTo(weakSelf.iconBackgroud_5.mas_leading).offset(-15 * 5);
        make.height.equalTo(@(pokersHeight_Rest));
        make.width.equalTo(@(pokersWidth_Rest));
    }];
}
- (void)gukeFourthAnimation{
    __weak GameViewController *weakSelf = self;
    [_guke_4.pokerImgViewArr[0] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.iconBackgroud_4.mas_bottom).offset(15);
        make.leading.equalTo(weakSelf.iconBackgroud_4);
        make.height.equalTo(@(pokersHeight_Rest));
        make.width.equalTo(@(pokersWidth_Rest));
    }];
    [_guke_4.pokerImgViewArr[1] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.iconBackgroud_4.mas_bottom).offset(15);
        make.leading.equalTo(weakSelf.iconBackgroud_4).offset(15 * 1);
        make.height.equalTo(@(pokersHeight_Rest));
        make.width.equalTo(@(pokersWidth_Rest));
    }];
    [_guke_4.pokerImgViewArr[2] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.iconBackgroud_4.mas_bottom).offset(15);
        make.leading.equalTo(weakSelf.iconBackgroud_4).offset(15 * 2);
        make.height.equalTo(@(pokersHeight_Rest));
        make.width.equalTo(@(pokersWidth_Rest));
    }];
    [_guke_4.pokerImgViewArr[3] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.iconBackgroud_4.mas_bottom).offset(15);
        make.leading.equalTo(weakSelf.iconBackgroud_4).offset(15 * 3);
        make.height.equalTo(@(pokersHeight_Rest));
        make.width.equalTo(@(pokersWidth_Rest));
    }];
    [_guke_4.pokerImgViewArr[4] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.iconBackgroud_4.mas_bottom).offset(15);
        make.leading.equalTo(weakSelf.iconBackgroud_4).offset(15 * 4);
        make.height.equalTo(@(pokersHeight_Rest));
        make.width.equalTo(@(pokersWidth_Rest));
    }];
}
- (void)gukePokerThirdAnimation{
    __weak GameViewController *weakSelf = self;
    [_guke_3.pokerImgViewArr[0] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.iconBackgroud_3.mas_bottom).offset(15);
        make.leading.equalTo(weakSelf.iconBackgroud_3);
        make.height.equalTo(@(pokersHeight_Rest));
        make.width.equalTo(@(pokersWidth_Rest));
    }];
    [_guke_3.pokerImgViewArr[1] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.iconBackgroud_3.mas_bottom).offset(15);
        make.leading.equalTo(weakSelf.iconBackgroud_3).offset(15 * 1);
        make.height.equalTo(@(pokersHeight_Rest));
        make.width.equalTo(@(pokersWidth_Rest));
    }];
    [_guke_3.pokerImgViewArr[2] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.iconBackgroud_3.mas_bottom).offset(15);
        make.leading.equalTo(weakSelf.iconBackgroud_3).offset(15 * 2);
        make.height.equalTo(@(pokersHeight_Rest));
        make.width.equalTo(@(pokersWidth_Rest));
    }];
    [_guke_3.pokerImgViewArr[3] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.iconBackgroud_3.mas_bottom).offset(15);
        make.leading.equalTo(weakSelf.iconBackgroud_3).offset(15 * 3);
        make.height.equalTo(@(pokersHeight_Rest));
        make.width.equalTo(@(pokersWidth_Rest));
    }];
    [_guke_3.pokerImgViewArr[4] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.iconBackgroud_3.mas_bottom).offset(15);
        make.leading.equalTo(weakSelf.iconBackgroud_3).offset(15 * 4);
        make.height.equalTo(@(pokersHeight_Rest));
        make.width.equalTo(@(pokersWidth_Rest));
    }];
}
- (void)gukePokerSecondAnimation{
    __weak GameViewController *weakSelf = self;
    [_guke_2.pokerImgViewArr[0] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.iconBackfroud_2.mas_centerY);
        make.leading.equalTo(weakSelf.iconBackfroud_2.mas_trailing).offset(15);
        make.height.equalTo(@(pokersHeight_Rest));
        make.width.equalTo(@(pokersWidth_Rest));
    }];
    [_guke_2.pokerImgViewArr[1] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.iconBackfroud_2.mas_centerY);
        make.leading.equalTo(weakSelf.iconBackfroud_2.mas_trailing).offset(15 * 2);
        make.height.equalTo(@(pokersHeight_Rest));
        make.width.equalTo(@(pokersWidth_Rest));
    }];
    [_guke_2.pokerImgViewArr[2] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.iconBackfroud_2.mas_centerY);
        make.leading.equalTo(weakSelf.iconBackfroud_2.mas_trailing).offset(15 * 3);
        make.height.equalTo(@(pokersHeight_Rest));
        make.width.equalTo(@(pokersWidth_Rest));
    }];
    [_guke_2.pokerImgViewArr[3] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.iconBackfroud_2.mas_centerY);
        make.leading.equalTo(weakSelf.iconBackfroud_2.mas_trailing).offset(15 * 4);
        make.height.equalTo(@(pokersHeight_Rest));
        make.width.equalTo(@(pokersWidth_Rest));
    }];
    [_guke_2.pokerImgViewArr[4] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.iconBackfroud_2.mas_centerY);
        make.leading.equalTo(weakSelf.iconBackfroud_2.mas_trailing).offset(15 * 5);
        make.height.equalTo(@(pokersHeight_Rest));
        make.width.equalTo(@(pokersWidth_Rest));
    }];
    
}
- (void)gukePokerFirstAnimation{
    __weak GameViewController *weakSelf = self;
    CGFloat imgBottom = -50;
    [_guke_1.pokerImgViewArr[2] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view);
        make.bottom.equalTo(weakSelf.view).offset(imgBottom);
        make.height.equalTo(@(pokersHeight));
        make.width.equalTo(@(pokersWidth));
    }];
    [_guke_1.pokerImgViewArr[1] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(weakSelf.guke_1.pokerImgViewArr[2].mas_leading).offset(-5);
        make.bottom.equalTo(weakSelf.view).offset(imgBottom);
        make.height.equalTo(@(pokersHeight));
        make.width.equalTo(@(pokersWidth));
    }];
    [_guke_1.pokerImgViewArr[3] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakSelf.guke_1.pokerImgViewArr[2].mas_trailing).offset(5);
        make.bottom.equalTo(weakSelf.view).offset(imgBottom);
        make.height.equalTo(@(pokersHeight));
        make.width.equalTo(@(pokersWidth));
    }];
    [_guke_1.pokerImgViewArr[0] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(weakSelf.guke_1.pokerImgViewArr[1].mas_leading).offset(-5);
        make.bottom.equalTo(weakSelf.view).offset(imgBottom);
        make.height.equalTo(@(pokersHeight));
        make.width.equalTo(@(pokersWidth));
    }];
    [_guke_1.pokerImgViewArr[4] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakSelf.guke_1.pokerImgViewArr[3].mas_trailing).offset(5);
        make.bottom.equalTo(weakSelf.view).offset(imgBottom);
        make.height.equalTo(@(pokersHeight));
        make.width.equalTo(@(pokersWidth));
    }];
}
- (NSInteger )judgePokersPoker:(NSArray<NSNumber *> *)arr{
    NSMutableArray *mArr = [[NSMutableArray alloc] init];
    for (NSNumber *num in arr) {
        NSInteger  x = [num integerValue]+1;
        x = x%13;
        if (x > 10 || x == 0) {
            x = 10;
        }
        [mArr addObject:[NSNumber numberWithInteger:x]];
    }
    NSInteger num_4 = 0;
    NSInteger num_5 = 0;
    for (int i = 0; i < 5; i++) {
        NSInteger num_1 = [mArr[i] integerValue];

        for (int j = 1; j < 5; j++) {
            if (i == j) {
                break;
            }
            NSInteger num_2 = [mArr[j] integerValue];
      
            for (int h = 2; h < 5; h++) {
                if (i == h || j == h) {
                    break;
                }
                NSInteger num_3 = [mArr[h] integerValue];
         
                if ((num_1 + num_2 + num_3) == 30 ||
                    (num_1 + num_2 + num_3) == 20 ||
                    (num_1 + num_2 + num_3) == 10) {
                    for (NSNumber *num in mArr) {
                        if ([num integerValue] != num_1 &&
                            [num integerValue] != num_2 &&
                            [num integerValue] != num_3) {
                            if (num_4 == 0) {
                                num_4 = [num integerValue];
                            }else
                                num_5 = [num integerValue];

                        }
                    }
                    NSLog(@"num1 %@ num2 %@ num3 %@ num4 %@ num5 %@",@(num_1),@(num_2),@(num_3),@(num_4),@(num_5));
                    if ((num_4 + num_5) == 10 || (num_4 + num_5) == 20) {
//                        return [UIImage imageNamed:@"牛牛"];
                        return 13;
                    }else{
                        if (num_4 + num_5 > 10) {
//                            return [UIImage imageNamed:[NSString stringWithFormat:@"牛%@",@((num_5+num_4) - 10)]];
                            return (num_5+num_4) - 10;
                        }else{
                            NSLog(@"牛%@",@(num_5+num_4));
//                            return [UIImage imageNamed:[NSString stringWithFormat:@"牛%@",@(num_5+num_4)]];
                            return (num_5+num_4) ;

                        }
                    }
                        
                }else{
                }
            }
        }
    }
    return 0;

}
- (UIImage *)getPokerMian:(NSInteger)num{
    if (num == 13) {
        return [UIImage imageNamed:@"牛牛"];
    }else if (num == 0){
        return [UIImage imageNamed:@"没牛"];
    }else
        return [UIImage imageNamed:[NSString stringWithFormat:@"牛%@",@(num)]];

}
- (UIImageView *)paimianImg_1{
    if (!_paimianImg_1) {
        _paimianImg_1 = [[UIImageView alloc] init];
        [self.view addSubview:_paimianImg_1];
        [_paimianImg_1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_iconBackfroud_1).offset(4);
            make.bottom.equalTo(_iconBackfroud_1);
        }];
    }
    return _paimianImg_1;
}
- (UIImageView *)paimianImg_2{
    if (!_paimianImg_2) {
        _paimianImg_2 = [[UIImageView alloc] init];
        [self.view addSubview:_paimianImg_2];
        [_paimianImg_2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_iconBackfroud_2).offset(4);
            make.bottom.equalTo(_iconBackfroud_2);
        }];
    }
    return _paimianImg_2;
}
-(AlertView *)xianAlert{
    if (!_xianAlert) {
        _xianAlert = [[AlertView alloc] init];
        _xianAlert.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [self.view addSubview:_xianAlert];
        __weak GameViewController *weakSelf = self;
        __block __weak AlertView *weakA = _xianAlert;

        [_xianAlert setDidSelect:^{
            [weakSelf chongzhi];
            [weakA removeFromSuperview];
            weakA = nil;
        }];
//        dispatch_time_t delayTime_1 = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0/*延迟执行时间*/ * NSEC_PER_SEC));
//        
//        dispatch_after(delayTime_1, dispatch_get_main_queue(), ^{
//            [_xianAlert removeFromSuperview];
//            _xianAlert = nil;
//        });
    }
    return _xianAlert;
}
- (void)chongzhi{
    if (_contest) {
        [_contest removeFromSuperview];
        _contest = nil;
    }
    if (_jiaBeiTime) {
        [_jiaBeiTime invalidate];
        _jiaBeiTime = nil;
    }
    if (_countTimer) {
        [_countTimer invalidate];
        _countTimer = nil;
    }
    if (_chuangImageView) {
        [_chuangImageView removeFromSuperview];
        _chuangImageView = nil;
    }
    if (_jiaBeiContest) {
        [_jiaBeiContest removeFromSuperview];
        _jiaBeiContest = nil;
    }
    NSArray<PlayerModel *> *arr = @[_guke_1,_guke_2,_guke_3,_guke_4,_guke_5];
    for (int i = 0; i < 5; i++) {
        
        arr[i].pokerArr = [[NSMutableArray alloc] init];
        for (UIImageView *img in arr[i].pokerImgViewArr) {
            [img removeFromSuperview];
        }
        arr[i].pokerImgViewArr = [[NSMutableArray alloc] initWithArray:@[
                                                                          [[UIImageView alloc] init],
                                                                          [[UIImageView alloc] init],
                                                                          [[UIImageView alloc] init],
                                                                          [[UIImageView alloc] init],
                                                                          [[UIImageView alloc] init]]];
        arr[i].isDizu = false;
        arr[i].jiabeiNum = 0;
        switch (i) {
            case 0:
                _guke_1 = arr[i];
                break;
            case 1:
                _guke_2 = arr[i];
                break;
            case 2:
                _guke_3 = arr[i];
                break;
            case 3:
                _guke_4 = arr[i];
                break;
            case 4:
                _guke_5 = arr[i];
                break;
            default:
                break;
        }
    }
    [_paimianImg_1 removeFromSuperview];
    _paimianImg_1 = nil;
    [_paimianImg_2 removeFromSuperview];
    _paimianImg_2 = nil;
    [_paimianImg_3 removeFromSuperview];
    _paimianImg_3 = nil;
    [_paimianImg_4 removeFromSuperview];
    _paimianImg_4 = nil;
    [_paimianImg_5 removeFromSuperview];
    _paimianImg_5 = nil;
    
    [_bei_1 removeFromSuperview];
    _bei_1 = nil;
    [_bei_2 removeFromSuperview];
    _bei_2 = nil;
    [_bei_3 removeFromSuperview];
    _bei_3 = nil;
    [_bei_4 removeFromSuperview];
    _bei_4 = nil;
    [_bei_5 removeFromSuperview];
    _bei_5 = nil;
    [self adddBeiSuView];
    _isFapai = NO;
}
- (UIImageView *)paimianImg_3{
    if (!_paimianImg_3) {
        _paimianImg_3 = [[UIImageView alloc] init];
        [self.view addSubview:_paimianImg_3];
        [_paimianImg_3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_iconBackgroud_3);
            make.top.equalTo(_iconBackgroud_3).offset(10);
        }];
    }
    return _paimianImg_3;
}
- (UIImageView *)paimianImg_4{
    if (!_paimianImg_4) {
        _paimianImg_4 = [[UIImageView alloc] init];
        [self.view addSubview:_paimianImg_4];
        [_paimianImg_4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_iconBackgroud_4);
            make.top.equalTo(_iconBackgroud_4).offset(10);
        }];
    }
    return _paimianImg_4;
}
- (UIImageView *)paimianImg_5{
    if (!_paimianImg_5) {
        _paimianImg_5 = [[UIImageView alloc] init];
        [self.view addSubview:_paimianImg_5];
        [_paimianImg_5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(_iconBackgroud_5).offset(-5);
            make.bottom.equalTo(_iconBackgroud_5);
        }];
    }
    return _paimianImg_5;
}
- (IBAction)gameDetail:(id)sender {
    WebDetailViewController *vc = [[WebDetailViewController alloc] init];
    UINavigationController *root = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self presentViewController:root animated:YES completion:nil];
}
- (IBAction)chongjj:(id)sender {
    [self chongzhi];
}
//支持的方向
-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscapeLeft;
}

//是否可以旋转
-(BOOL)shouldAutorotate
{
    return YES;
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
