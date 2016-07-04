//
//  testViewController.m
//  新闻
//
//  Created by cocoaML on 15/9/23.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "testViewController.h"
#import "UIBarButtonItem+gyh.h"

@interface testViewController ()

@end

@implementation testViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 返回按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem ItemWithIcon:@"navigationbar_back_os7" highIcon:nil target:self action:@selector(backClick)];

    // 喜欢按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem ItemWithIcon:@"dislike" highIcon:nil target:self action:@selector(like)];
    
    [self initWebView];
}

-(void)like
{
    
}

-(void)backClick
{
    //    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];    //转场动画需要
    
    [self.navigationController setNavigationBarHidden:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

-(void)initWebView
{
    NSURL *url = [NSURL URLWithString:_url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    UIWebView *webview = [[UIWebView alloc]init];
    webview.frame = self.view.frame;
    [webview loadRequest:request];
    [self.view addSubview:webview];
}


@end
