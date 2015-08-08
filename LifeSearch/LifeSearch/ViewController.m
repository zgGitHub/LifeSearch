//
//  ViewController.m
//  LifeSearch
//
//  Created by qianfeng01 on 15-8-7.
//  Copyright (c) 2015年 zg. All rights reserved.
//

#import "ViewController.h"
#import "TFHpple.h"
#define kUrl @"http://wap.ip138.com/"
@interface ViewController (){
    UIWebView *_webView;
}

@property (nonatomic,strong) NSMutableArray *dataArr;
@property (nonatomic,strong) NSMutableArray *urlArr;
@property (nonatomic,strong) UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    self.dataArr = [[NSMutableArray alloc]init];
    self.urlArr = [[NSMutableArray alloc]init];
//    [self createWebView];
    //解析该网页
//    dispatch_queue_t queue = dispatch_queue_create("queue", NULL);
//    dispatch_async(queue, ^{
//        [self parserHtml];
//    });
    [self parserHtml];
    [self createScrollView];
    [self createButton];
    
}

- (void)createScrollView{
     self.scrollView= [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 600)];
//    CGFloat hight = 75+(60+10)*self.dataArr.count;
    CGFloat hight = 750;
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, hight);
    self.scrollView.bounces = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
}

#pragma mark -创建webview
- (void)createWebView{
    CGRect frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height);
    _webView = [[UIWebView alloc]initWithFrame:frame];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:kUrl]];
    [_webView loadRequest:request];
    [self.view addSubview:_webView];
}


#pragma mark - 解析网页
- (void)parserHtml{
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:kUrl]];
    TFHpple *parser = [[TFHpple alloc]initWithHTMLData:data];
    NSArray *arr = [parser searchWithXPathQuery:@"//div"];
    TFHppleElement *element = [arr objectAtIndex:0];
    NSArray *aArr = [element children];
    for (TFHppleElement *element in aArr) {
        if ([[element content] length] >2) {
            static int i = 0;
            if (i++ < 7) {
                [self.dataArr addObject:[element content]];
                [self.urlArr addObject:[element objectForKey:@"href"]];
            }
            
        }
    }
}


- (void)createButton{
    
    for (NSInteger i = 0; i < self.dataArr.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle:self.dataArr[i] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor magentaColor]];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        button.tag = 10+i;
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [button setFrame:CGRectMake((self.view.frame.size.width)/2-100, 75+(60+10)*i, 200, 30)];
        [self.scrollView addSubview:button];
        
    }
}


//单纯的webview使用的时候可以使用以下方法
- (IBAction)selectAction:(UISegmentedControl *)sender {
    NSInteger index = sender.selectedSegmentIndex;

    switch (index) {
        case 0:
        {
//            [_webView goBack];
        }
            break;
        case 1:
        {
//            [_webView goForward];

        }
            break;
        case 2:
        {
//            [_webView reload];
        }
            break;
        case 3:
        {
//            [_webView stopLoading];
        }
            break;
        default:
            break;
    }
    
}

- (void)btnClick:(UIButton *)button{
    NSInteger num = button.tag;
    switch (num) {
        case 10:
        {
            WeatherViewController *control = [[WeatherViewController alloc]init];
            control.url = self.urlArr[0];
            control.title = self.dataArr[0];
            [self.navigationController pushViewController:control animated:YES];
        }
            break;
        case 11:
        {
            SimViewController *control = [[SimViewController alloc]init];
            control.url = [NSString stringWithFormat:@"%@%@",kUrl,self.urlArr[1]];
            control.title = self.dataArr[1];
            [self.navigationController pushViewController:control animated:YES];
        }
            break;
        case 12:
        {
            PostViewController *control = [[PostViewController alloc]init];
            control.url = [NSString stringWithFormat:@"%@%@",kUrl,self.urlArr[2]];
            control.title = self.dataArr[2];
            [self.navigationController pushViewController:control animated:YES];
        }
            break;
        case 13:
        {
            IPViewController *control = [[IPViewController alloc]init];
            control.url = [NSString stringWithFormat:@"%@%@",kUrl,self.urlArr[3]];
            control.title = self.dataArr[3];
            [self.navigationController pushViewController:control animated:YES];
        }
            break;
        case 14:
        {
            IdViewController *control = [[IdViewController alloc]init];
            control.url = [NSString stringWithFormat:@"%@%@",kUrl,self.urlArr[4]];
            control.title = self.dataArr[4];
            [self.navigationController pushViewController:control animated:YES];
        }
            break;
        case 15:
        {
            TrainTimeViewController *control = [[TrainTimeViewController alloc]init];
            control.url = self.urlArr[5];
            control.title = self.dataArr[5];
            [self.navigationController pushViewController:control animated:YES];
        }
            break;
        case 16:
        {
            TrainTicketOutletsViewController *control = [[TrainTicketOutletsViewController alloc]init];
            control.url = self.urlArr[6];
            control.title = self.dataArr[6];
            [self.navigationController pushViewController:control animated:YES];
            
        }
            break;
            
        default:
            break;
    }
}
@end
