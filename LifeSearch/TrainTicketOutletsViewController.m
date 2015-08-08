//
//  TrainTicketOutletsViewController.m
//  LifeSearch
//
//  Created by qianfeng01 on 15-8-7.
//  Copyright (c) 2015年 zg. All rights reserved.
//

#import "TrainTicketOutletsViewController.h"

@interface TrainTicketOutletsViewController ()

@end

@implementation TrainTicketOutletsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createWebView];
}

- (void)createWebView{
    UIWebView *view = [[UIWebView alloc]initWithFrame:self.view.bounds];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:self.url]];
    [view loadRequest:request];
    [self.view addSubview:view];
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
