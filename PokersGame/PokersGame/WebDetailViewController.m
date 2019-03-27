//
//  WebDetailViewController.m
//  CardGame
//
//  Copyright © 2017年 com.what. All rights reserved.
//

#import "WebDetailViewController.h"

@interface WebDetailViewController ()
@property (nonatomic) UIWebView *webView;
@end

@implementation WebDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.webView loadHTMLString:[self loadHTMLByStringFormat:@{@"content":@"&emsp斗牛，一共有五名玩家，每名玩家拥有五张手牌。如果手牌中有三张手牌（JQK按10计算）,相加倍数为10的倍数，判定为有牛，不然算没牛。有牛之后，看剩下的两张牌相加个位数，数字越大牌越大。"}] baseURL:nil];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(popcontr)];
}
- (void)popcontr{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (UIWebView *)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        _webView.backgroundColor = [UIColor whiteColor];
        _webView.dataDetectorTypes = UIDataDetectorTypeAll;
        [self.view addSubview:_webView];
    }
    return _webView;
}
- (NSString *)loadHTMLByStringFormat:(NSDictionary *)data
{
    NSString *templatePath = [[NSBundle mainBundle] pathForResource:@"HtmlWork" ofType:@"html"];
    NSMutableString *html = [[NSMutableString alloc] initWithContentsOfFile:templatePath encoding:NSUTF8StringEncoding error:nil];
    [html replaceOccurrencesOfString:@"key_content" withString:data[@"content"] options:NSCaseInsensitiveSearch range:NSMakeRange(0, html.length)];
    return html;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
