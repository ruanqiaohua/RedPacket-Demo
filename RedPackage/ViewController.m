//
//  ViewController.m
//  RedPackage
//
//  Created by 阮巧华 on 2016/11/17.
//  Copyright © 2016年 阮巧华. All rights reserved.
//

#import "ViewController.h"
#import "SendRedPackagewController.h"
#import "OpenRedPacketViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    UIView *redPackageView = [[UIView alloc] initWithFrame:CGRectMake(0, 300, 200, 80)];
    redPackageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redPackageView];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(redPackageViewAction:)];
    [redPackageView addGestureRecognizer:tap];
    
    UIButton *sendRedPacketBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sendRedPacketBtn.frame = CGRectMake(self.view.frame.size.width-100, self.view.frame.size.height-200, 50, 50);
    [sendRedPacketBtn setBackgroundColor:[UIColor redColor]];
    [sendRedPacketBtn setTitle:@"发" forState:UIControlStateNormal];
    [sendRedPacketBtn addTarget:self action:@selector(sendRedPacketBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sendRedPacketBtn];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)sendRedPacketBtnAction:(UIButton *)sender {
    
    SendRedPackagewController *VC = [SendRedPackagewController new];
    VC.view.backgroundColor = [UIColor clearColor];
    VC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:VC animated:YES completion:nil];
}

- (void)redPackageViewAction:(UITapGestureRecognizer *)sender {
    
    OpenRedPacketViewController *VC = [OpenRedPacketViewController new];
    VC.view.backgroundColor = [UIColor clearColor];
    VC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:VC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
