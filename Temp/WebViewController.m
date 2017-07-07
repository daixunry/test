//
//  WebViewController.m
//  Temp
//
//  Created by daixu on 17/4/12.
//  Copyright © 2017年 daixu. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIScrollViewDelegate,UIWebViewDelegate>
{
    UIWebView *webV;
}
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    webV = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [webV loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    webV.scrollView.delegate = self;
    [self.view addSubview:webV];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scr:%f",scrollView.contentOffset.y);
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
