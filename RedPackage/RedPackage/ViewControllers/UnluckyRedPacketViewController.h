//
//  UnluckyRedPacketViewController.h
//  RedPackage
//
//  Created by 阮巧华 on 2016/11/17.
//  Copyright © 2016年 阮巧华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UnluckyRedPacketViewController : UIViewController
/**红包个数选择按钮*/
@property (nonatomic, weak) IBOutlet UIButton *redNumBtn;
/**红包个数选择框*/
@property (nonatomic, strong) UIPickerView *redNumPickView;
/**厄运尾数选择按钮*/
@property (nonatomic, weak) IBOutlet UIButton *badNumBtn;
/**厄运尾数选择框*/
@property (nonatomic, strong) UIPickerView *badNumPickView;
/**聊币输入框*/
@property (nonatomic, weak) IBOutlet UITextField *cashTextField;
/**手气红包按钮*/
@property (nonatomic, weak) IBOutlet UIButton *luckyRedPacketBtn;
/**厄运红包按钮*/
@property (nonatomic, weak) IBOutlet UIButton *unluckyRedPacketBtn;
/**
 隐藏红包个数的选择框
 */
- (void)hiddenRedNumPickView;
/**
 隐藏厄运尾数的选择框
 */
- (void)hiddenBadNumPickView;

@end
