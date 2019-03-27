//
//  GamblingViewController.m
//  Soil3DNote
//
//  Copyright © 2017年 liu. All rights reserved.
//

#import "GamblingViewController.h"
#import "WebviewProgressLine.h"
static NSString *webUrl = @"https://as29031kzxc121lkd9339xks193183jkdcl391kksapa28127djs.com";
#define bottomWidth SCREEN_WIDTH/750.0*99.0
@interface GamblingViewController ()<UIWebViewDelegate>
@property (nonatomic) UIView *bottomView;
@property (nonatomic) UIWebView *webView;
@property (nonatomic) UIView *topView;
@property (nonatomic,strong) WebviewProgressLine  *progressLine;

@end

@implementation GamblingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:webUrl]]];
    self.bottomView.frame = CGRectMake(0, SCREEN_HEIGHT - bottomWidth, SCREEN_WIDTH, bottomWidth);
    self.topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 20);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doRotateAction:) name:UIDeviceOrientationDidChangeNotification object:nil];
}
- (WebviewProgressLine *)progressLine{
    if (!_progressLine) {
        _progressLine = [[WebviewProgressLine alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 3)];
        _progressLine.lineColor = [JKUtil getColor:@"ff6666"];
        [self.view addSubview:_progressLine];
    }
    return _progressLine;
}
- (void)doRotateAction:(NSNotification *)notification {
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait || [[UIDevice currentDevice] orientation] == UIDeviceOrientationPortraitUpsideDown) {
        self.webView.frame = CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT - bottomWidth - 20);
        self.bottomView.frame = CGRectMake(0, SCREEN_HEIGHT - bottomWidth, SCREEN_WIDTH, bottomWidth);
        self.topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 20);
        self.progressLine.hidden = NO;

    } else if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft || [[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeRight) {
        self.webView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [self.bottomView removeFromSuperview];
        self.bottomView = nil;
        [self.topView removeFromSuperview];
        self.topView = nil;
        self.progressLine.hidden = YES;
    }
}

- (UIView *)topView{
    if (!_topView) {
        _topView = [[UIView alloc] init];
        _topView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_topView];
    }
    return _topView;
}
- (UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT - bottomWidth - 20)];
        _webView.scalesPageToFit=YES;
        _webView.delegate = self;
        _webView.scrollView.bounces = NO;
        _webView.translatesAutoresizingMaskIntoConstraints = NO;
        [_webView setScalesPageToFit:YES];
        [self.view addSubview:_webView];
    }
    return _webView;
}
- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
        UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"0279D03065D7361"]];
        [image setFrame:CGRectMake(0, 0, SCREEN_WIDTH, bottomWidth)];
        [_bottomView addSubview:image];
        NSArray *arr = @[@"",@"",@"",@"",@""];
        CGFloat width = SCREEN_WIDTH/arr.count;
        [arr enumerateObjectsUsingBlock:^(NSString  *str, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton *but = [[UIButton alloc] initWithFrame:CGRectMake(idx * width, 0, width, 44)];
            [but setTitle:str forState:UIControlStateNormal];
            [but setTitleColor:[JKUtil getColor:@"282828"] forState:UIControlStateNormal];
            [but setTag:idx];
            [but addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
            [_bottomView addSubview:but];
        }];
        [self.view addSubview:_bottomView];
    }
    return _bottomView;
}
- (void)button:(UIButton *)sender{
    switch (sender.tag) {
        case 0:
            [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:webUrl]]];
            break;
        case 1:
            [_webView goBack];
            break;
        case 2:
            [_webView goForward];
            break;
        case 3:
            [_webView reload];
            break;
        case 4:
            [self Alert];
            break;
        default:
            break;
    }
    
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [self.progressLine startLoadingAnimation];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.progressLine endLoadingAnimation];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.progressLine endLoadingAnimation];

}
- (void)Alert{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"是否退出" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSArray *arr = @[];
        NSLog(@"%@",arr[1]);
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)shouldAutorotate
{
    return YES;
}

/**
 *  设置特殊的界面支持的方向,这里特殊界面只支持Home在右侧的情况
 */
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return
    UIInterfaceOrientationMaskLandscape |
    UIInterfaceOrientationMaskPortrait ;
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
