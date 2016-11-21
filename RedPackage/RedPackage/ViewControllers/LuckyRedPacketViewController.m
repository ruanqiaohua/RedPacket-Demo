//
//  LuckyRedPacketViewController.m
//  RedPackage
//
//  Created by 阮巧华 on 2016/11/17.
//  Copyright © 2016年 阮巧华. All rights reserved.
//

#import "LuckyRedPacketViewController.h"

@interface LuckyRedPacketViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, copy) NSArray *redNums;//红包个数

@property (nonatomic, copy) NSArray *sendRanges;//发送范围

@end

@implementation LuckyRedPacketViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _redNums = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
    [_redNumBtn setTitle:[NSString stringWithFormat:@"%@",_redNums.firstObject] forState:UIControlStateNormal];

    _sendRanges = @[@"本房间",@"所有房间"];
    [_redRangeBtn setTitle:[NSString stringWithFormat:@"%@",_sendRanges.firstObject] forState:UIControlStateNormal];
    
    // Do any additional setup after loading the view.
}

- (void)setRedNums:(NSMutableArray *)redNums {
    _redNums = redNums;
    [_redNumPickView reloadAllComponents];
}

- (void)setSendRanges:(NSMutableArray *)sendRanges {
    _sendRanges = sendRanges;
    [_redRangePickView reloadAllComponents];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addRedNumPickView {
    if (!_redNumPickView) {
        CGRect frame = _redNumBtn.frame;
        frame.origin.x += _redNumBtn.superview.frame.origin.x;
        frame.origin.y += _redNumBtn.superview.frame.origin.y + frame.size.height;
        frame.size.height = 100;
        _redNumPickView = [[UIPickerView alloc] initWithFrame:frame];
        _redNumPickView.backgroundColor = [UIColor whiteColor];
        _redNumPickView.delegate = self;
        _redNumPickView.dataSource = self;
        _redNumPickView.showsSelectionIndicator = YES;
    }
    [self.view addSubview:_redNumPickView];
}

- (void)addRedRangePickView {
    if (!_redRangePickView) {
        CGRect frame = _redRangeBtn.frame;
        frame.origin.x += _redRangeBtn.superview.frame.origin.x;
        frame.origin.y += _redRangeBtn.superview.frame.origin.y + frame.size.height;
        frame.size.height = 100;
        _redRangePickView = [[UIPickerView alloc] initWithFrame:frame];
        _redRangePickView.backgroundColor = [UIColor whiteColor];
        _redRangePickView.delegate = self;
        _redRangePickView.dataSource = self;
        _redRangePickView.showsSelectionIndicator = YES;
    }
    [self.view addSubview:_redRangePickView];
}

#pragma mark - UIButton

- (IBAction)redNumBtnAction:(UIButton *)sender {
    
    if (sender.selected) {
        [self hiddenRedNumPickView];
    } else {
        [self.view endEditing:YES];
        [self hiddenRedRangePickView];
        [self addRedNumPickView];
        _redNumBtn.selected = YES;
    }
}

- (IBAction)redRangeBtnAction:(UIButton *)sender {
    
    if (sender.selected) {
        [self hiddenRedRangePickView];
    } else {
        [self.view endEditing:YES];
        [self hiddenRedNumPickView];
        [self addRedRangePickView];
        _redRangeBtn.selected = YES;
    }
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (pickerView == _redNumPickView) {
        return _redNums.count;
    }
    return _sendRanges.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (pickerView == _redNumPickView) {
        return [NSString stringWithFormat:@"%@",_redNums[row]];
    }
    return [NSString stringWithFormat:@"%@",_sendRanges[row]];
}

#pragma mark - UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (pickerView == _redNumPickView) {
        [_redNumBtn setTitle:[NSString stringWithFormat:@"%@",_redNums[row]] forState:UIControlStateNormal];
    } else {
        [_redRangeBtn setTitle:[NSString stringWithFormat:@"%@",_sendRanges[row]] forState:UIControlStateNormal];
    }
}

- (void)hiddenRedNumPickView {
    
    if (!_redNumPickView) return;
    [UIView animateWithDuration:0.2 animations:^{
        CGRect frame = _redNumPickView.frame;
        frame.size.height = 0.0;
        _redNumPickView.frame = frame;
    } completion:^(BOOL finished) {
        if (finished) {
            _redNumBtn.selected = NO;
            [_redNumPickView removeFromSuperview];
            _redNumPickView = nil;
        }
    }];
}

- (void)hiddenRedRangePickView {
    
    if (!_redRangePickView) return;
    [UIView animateWithDuration:0.2 animations:^{
        CGRect frame = _redRangePickView.frame;
        frame.size.height = 0.0;
        _redRangePickView.frame = frame;
    } completion:^(BOOL finished) {
        if (finished) {
            _redRangeBtn.selected = NO;
            [_redRangePickView removeFromSuperview];
            _redRangePickView = nil;
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

@end
