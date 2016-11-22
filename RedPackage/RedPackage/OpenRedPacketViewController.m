//
//  OpenRedPacketViewController.m
//  RedPackage
//
//  Created by 阮巧华 on 2016/11/18.
//  Copyright © 2016年 阮巧华. All rights reserved.
//

#import "OpenRedPacketViewController.h"
#import "OpeningRedPacketViewController.h"
#import "OpenRedPacketEndViewController.h"
#import "OpenErrorRedPacketViewController.h"

@interface OpenRedPacketViewController ()

@property (nonatomic, strong) UIViewController *currentVC;
@property (nonatomic, strong) OpeningRedPacketViewController *openingRedPacketVC;
@property (nonatomic, strong) OpenRedPacketEndViewController *openRedPacketEndVC;
@property (nonatomic, strong) OpenErrorRedPacketViewController *openErrorRedPacketVC;

@end

@implementation OpenRedPacketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _openingRedPacketVC = [[OpeningRedPacketViewController alloc] initWithNibName:@"OpeningRedPacketViewController" bundle:nil];
    _openingRedPacketVC.view.frame = self.view.frame;
    [_openingRedPacketVC.openBtn addTarget:self action:@selector(openBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    _currentVC = _openingRedPacketVC;
    [self addChildViewController:_openingRedPacketVC];
    
    [self.view addSubview:_openingRedPacketVC.view];
    
    _openRedPacketEndVC = [[OpenRedPacketEndViewController alloc] initWithNibName:@"OpenRedPacketEndViewController" bundle:nil];
    _openRedPacketEndVC.view.frame = self.view.frame;
    
    _openErrorRedPacketVC = [[OpenErrorRedPacketViewController alloc] initWithNibName:@"OpenErrorRedPacketViewController" bundle:nil];
    _openErrorRedPacketVC.view.frame = self.view.frame;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIButton

- (void)openBtnAction:(UIButton *)sender {
    
    //请求服务端开始抢红包
    
    //成功
    [self chooseViewControllerView:1000];
    //红包抢完了
    //[self chooseViewControllerView:1002];
}

- (void)chooseViewControllerView:(NSInteger)index {
    
    switch (index) {
        case 1000://红包开启成功
        {
            [self changeControllerFromOldController:_currentVC toNewController:_openRedPacketEndVC];
        }
            break;
        case 1001://红包开启页面
        {
            [self changeControllerFromOldController:_currentVC toNewController:_openingRedPacketVC];
        }
            break;
        case 1002://红包开启失败
        {
            [self changeControllerFromOldController:_currentVC toNewController:_openErrorRedPacketVC];
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
    
    UIView *view = touches.anyObject.view;
    if (view == self.view || view == _openRedPacketEndVC.view || view == _openingRedPacketVC.view || view == _openErrorRedPacketVC.view) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
