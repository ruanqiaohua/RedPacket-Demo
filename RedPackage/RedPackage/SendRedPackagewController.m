//
//  SendRedPackagewController.m
//  RedPackage
//
//  Created by 阮巧华 on 2016/11/17.
//  Copyright © 2016年 阮巧华. All rights reserved.
//

#import "SendRedPackagewController.h"
#import "LuckyRedPacketViewController.h"
#import "UnluckyRedPacketViewController.h"

@interface SendRedPackagewController ()

@property (nonatomic, strong) UIViewController *currentVC;
@property (nonatomic, strong) LuckyRedPacketViewController *luckyRedPacketVC;
@property (nonatomic, strong) UnluckyRedPacketViewController *unluckyRedPacketVC;

@end

@implementation SendRedPackagewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _unluckyRedPacketVC = [[UnluckyRedPacketViewController alloc] initWithNibName:@"UnluckyRedPacketViewController" bundle:nil];
    _unluckyRedPacketVC.view.frame = self.view.frame;
    [_unluckyRedPacketVC.luckyRedPacketBtn addTarget:self action:@selector(chooseViewControllerView:) forControlEvents:UIControlEventTouchUpInside];
    _currentVC = _unluckyRedPacketVC;
    [self addChildViewController:_unluckyRedPacketVC];

    [self.view addSubview:_unluckyRedPacketVC.view];
    
    _luckyRedPacketVC = [[LuckyRedPacketViewController alloc] initWithNibName:@"LuckyRedPacketViewController" bundle:nil];
    _luckyRedPacketVC.view.frame = self.view.frame;
    [_luckyRedPacketVC.unluckyRedPacketBtn addTarget:self action:@selector(chooseViewControllerView:) forControlEvents:UIControlEventTouchUpInside];

    [self requestData];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)requestData {
    
    
}

#pragma mark - UIButton

- (void)chooseViewControllerView:(UIButton *)sender {
    
    switch (sender.tag) {
        case 2000:
        {
            [self changeControllerFromOldController:_currentVC toNewController:_luckyRedPacketVC];
        }
            break;
        case 2001:
        {
            [self changeControllerFromOldController:_currentVC toNewController:_unluckyRedPacketVC];
        }
            break;
        default:
            break;
    }
}

- (void)changeControllerFromOldController:(UIViewController *)oldController toNewController:(UIViewController *)newController {
    
    [self addChildViewController:newController];
    /**
     *  切换ViewController
     */
    [self transitionFromViewController:oldController toViewController:newController duration:0.3 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        //做一些动画
        
    } completion:^(BOOL finished) {
        
        if (finished) {
            
            //移除oldController，但在removeFromParentViewController：方法前不会调用willMoveToParentViewController:nil 方法，所以需要显示调用
            [self didMoveToParentViewController:newController];
            [oldController willMoveToParentViewController:nil];
            [oldController removeFromParentViewController];
            _currentVC = newController;
        } else {
            _currentVC = oldController;
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if ([_luckyRedPacketVC.cashTextField isFirstResponder] || [_luckyRedPacketVC.blessTextField isFirstResponder] || [_unluckyRedPacketVC.cashTextField isFirstResponder]) {
        [self.view endEditing:YES];
        return;
    }
    if (_luckyRedPacketVC.redNumPickView || _luckyRedPacketVC.redRangePickView || _unluckyRedPacketVC.redNumPickView || _unluckyRedPacketVC.badNumPickView) {
        [_luckyRedPacketVC hiddenRedNumPickView];
        [_luckyRedPacketVC hiddenRedRangePickView];
        [_unluckyRedPacketVC hiddenRedNumPickView];
        [_unluckyRedPacketVC hiddenBadNumPickView];
        return;
    }
    UIView *view = touches.anyObject.view;
    if (view == self.view || view == _luckyRedPacketVC.view || view == _unluckyRedPacketVC.view) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
