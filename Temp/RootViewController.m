//
//  RootViewController.m
//  Temp
//
//  Created by daixu on 17/4/12.
//  Copyright © 2017年 daixu. All rights reserved.
//

#import "RootViewController.h"
#import "WebViewController.h"
#import "GCDViewController.h"
#import "LabelViewController.h"
#import "TImageControllerAViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)gotoWebView:(id)sender {
    WebViewController *web = [[WebViewController alloc] init];
    [self.navigationController pushViewController:web animated:YES];
}
- (IBAction)gotoGCDViewC:(id)sender {
    GCDViewController *gcd = [GCDViewController new];
    [self.navigationController pushViewController:gcd animated:YES];
}
- (IBAction)gotolabelvc:(id)sender {
    LabelViewController *gcd = [LabelViewController new];
    [self.navigationController pushViewController:gcd animated:YES];
}
- (IBAction)gotoimagevc:(id)sender {
    TImageControllerAViewController *ivc = [TImageControllerAViewController new];
    [self.navigationController pushViewController:ivc animated:YES];
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
