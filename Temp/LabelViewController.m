//
//  LabelViewController.m
//  Temp
//
//  Created by daixu on 2017/7/6.
//  Copyright © 2017年 daixu. All rights reserved.
//

#import "LabelViewController.h"
//aa
//cc
//dd
//44
//55tttt
@interface LabelViewController ()

@end

@implementation LabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 0, 0)];
    NSString *originPrice = @"中文100086.75";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:originPrice];
    [attributedString addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, originPrice.length)];
    //使富文本支持中文
    [attributedString addAttribute:NSBaselineOffsetAttributeName value:@(NSUnderlineStyleSingle) range:NSMakeRange(0, originPrice.length)];
    
    [attributedString addAttribute:NSStrikethroughColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, originPrice.length)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12.0f] range:NSMakeRange(0, originPrice.length)];
    l.attributedText = attributedString;
    [l sizeToFit];
    [self.view addSubview:l];
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
