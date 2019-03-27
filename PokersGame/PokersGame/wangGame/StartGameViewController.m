//
//  StartGameViewController.m
//  baijiale
//
//  Copyright © 2017年 yang. All rights reserved.
//

#import "StartGameViewController.h"
#import "View+MASAdditions.h"
#import "GameViewController.h"
//#import "CusNavViewController.h"
#import "AppDelegate.h"
@interface StartGameViewController ()

@end

@implementation StartGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.barTintColor = [UIColor clearColor];

    UIImageView *backgroudImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"12"]];
    [self.view addSubview:backgroudImage];
    [backgroudImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.bottom.top.trailing.equalTo(self.view);
    }];
    UILabel *label = [UILabel new];
    label.textColor = [JKUtil getColor:@"ff6400"];
    [label setFont:[UIFont fontWithName:@"Helvetica-BoldOblique" size:36]];
    label.text  = @"斗牛";
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
    }];
    UIImageView *image_1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shengti"]];
    [self.view addSubview:image_1];
    [image_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.trailing.equalTo(self.view).offset(-40);
        make.width.equalTo(@(200));
        make.height.equalTo(@(200/1.5));
    }];
//    UIImageView *image_2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"GoldPig_Avatar"]];
//    [self.view addSubview:image_2];
//    [image_2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.equalTo(self.view).offset(40);
//        make.centerY.equalTo(self.view).offset(40);
//    }];

    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:@"开始游戏"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(palyGame) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-30);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@(129));
        make.height.equalTo(@(59));
    }];
}
- (void)palyGame{
    GameViewController *gameVC = [GameViewController new];
    [self presentViewController:gameVC animated:YES completion:nil];
//    [self.navigationController pushViewController:control animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
