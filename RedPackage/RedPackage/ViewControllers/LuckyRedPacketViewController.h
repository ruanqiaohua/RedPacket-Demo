//
//  LuckyRedPacketViewController.h
//  RedPackage
//
//  Created by 阮巧华 on 2016/11/17.
//  Copyright © 2016年 阮巧华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LuckyRedPacketViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIButton *redNumBtn;

@property (nonatomic, strong) UIPickerView *redNumPickView;

@property (nonatomic, weak) IBOutlet UIButton *redRangeBtn;

@property (nonatomic, strong) UIPickerView *redRangePickView;

@property (nonatomic, weak) IBOutlet UITextField *cashTextField;

@property (nonatomic, weak) IBOutlet UITextField *blessTextField;

@property (nonatomic, weak) IBOutlet UIButton *luckyRedPacketBtn;

@property (nonatomic, weak) IBOutlet UIButton *unluckyRedPacketBtn;
/**
 隐藏红包个数的选择框
 */
- (void)hiddenRedNumPickView;
/**
 隐藏发送范围的选择框
 */
- (void)hiddenRedRangePickView;

@end
