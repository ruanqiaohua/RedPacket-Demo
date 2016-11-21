//
//  LuckyRedPacketViewController.h
//  RedPackage
//
//  Created by 阮巧华 on 2016/11/17.
//  Copyright © 2016年 阮巧华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LuckyRedPacketViewController : UIViewController

/**红包个数选择按钮*/
@property (nonatomic, weak) IBOutlet UIButton *redNumBtn;
/**红包个数选择框*/
@property (nonatomic, strong) UIPickerView *redNumPickView;
/**红包发送范围按钮*/
@property (nonatomic, weak) IBOutlet UIButton *redRangeBtn;
/**红包发送范围选择框*/
@property (nonatomic, strong) UIPickerView *redRangePickView;
/**聊币输入框*/
@property (nonatomic, weak) IBOutlet UITextField *cashTextField;
/**祝福输入框*/
@property (nonatomic, weak) IBOutlet UITextField *blessTextField;
/**手气红包按钮*/
@property (nonatomic, weak) IBOutlet UIButton *luckyRedPacketBtn;
/**厄运红包按钮*/
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
