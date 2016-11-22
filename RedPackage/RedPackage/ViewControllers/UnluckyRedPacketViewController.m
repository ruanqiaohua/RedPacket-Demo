//
//  UnluckyRedPacketViewController.m
//  RedPackage
//
//  Created by 阮巧华 on 2016/11/17.
//  Copyright © 2016年 阮巧华. All rights reserved.
//

#import "UnluckyRedPacketViewController.h"

@interface UnluckyRedPacketViewController ()<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>

/**可选聊币*/
@property (nonatomic, copy) NSArray *cashNums;
/**红包个数*/
@property (nonatomic, copy) NSArray *redNums;
/**厄运尾数*/
@property (nonatomic, copy) NSArray *badNums;

@end

@implementation UnluckyRedPacketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cashNums = @[@"100",@"200",@"300"];
    self.redNums = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
    self.badNums = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
    // Do any additional setup after loading the view.
}

- (void)setCashNums:(NSArray *)cashNums {
    _cashNums = cashNums;
    for (int i=0; i<_cashChooseBtns.count; i++) {
        UIButton *chooseBtn = _cashChooseBtns[i];
        NSString *text = cashNums[i];
        [chooseBtn setTitle:text forState:UIControlStateNormal];
    }
}

- (void)setRedNums:(NSArray *)redNums {
    _redNums = redNums;
    [_redNumBtn setTitle:[NSString stringWithFormat:@"%@",_redNums.firstObject] forState:UIControlStateNormal];
    [_redNumPickView reloadAllComponents];
}

- (void)setBadNums:(NSArray *)badNums {
    _badNums = badNums;
    [_badNumBtn setTitle:[NSString stringWithFormat:@"%@",_badNums.firstObject] forState:UIControlStateNormal];
    [_badNumPickView reloadAllComponents];
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

- (void)addBadNumPickView {
    if (!_badNumPickView) {
        CGRect frame = _badNumBtn.frame;
        frame.origin.x += _badNumBtn.superview.frame.origin.x;
        frame.origin.y += _badNumBtn.superview.frame.origin.y + frame.size.height;
        frame.size.height = 100;
        _badNumPickView = [[UIPickerView alloc] initWithFrame:frame];
        _badNumPickView.backgroundColor = [UIColor whiteColor];
        _badNumPickView.delegate = self;
        _badNumPickView.dataSource = self;
        _badNumPickView.showsSelectionIndicator = YES;
    }
    [self.view addSubview:_badNumPickView];
}

#pragma mark - UIButton

- (IBAction)redNumBtnAction:(UIButton *)sender {
    
    if (sender.selected) {
        [self hiddenRedNumPickView];
    } else {
        [self.view endEditing:YES];
        [self hiddenBadNumPickView];
        [self addRedNumPickView];
        _redNumBtn.selected = YES;
    }
}

- (IBAction)badNumBtnAction:(UIButton *)sender {
    
    if (sender.selected) {
        [self hiddenBadNumPickView];
    } else {
        [self.view endEditing:YES];
        [self hiddenRedNumPickView];
        [self addBadNumPickView];
        _badNumBtn.selected = YES;
    }
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (pickerView == _redNumPickView) {
        return _redNums.count;
    } else if (pickerView == _badNumPickView) {
        return _badNums.count;
    }
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (pickerView == _redNumPickView) {
        return [NSString stringWithFormat:@"%@",_redNums[row]];
    } else if (pickerView == _badNumPickView) {
        return [NSString stringWithFormat:@"%@",_badNums[row]];
    }
    return @"";
}

#pragma mark - UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (pickerView == _redNumPickView) {
        [_redNumBtn setTitle:[NSString stringWithFormat:@"%@",_redNums[row]] forState:UIControlStateNormal];
    } else if (pickerView == _badNumPickView) {
        [_badNumBtn setTitle:[NSString stringWithFormat:@"%@",_badNums[row]] forState:UIControlStateNormal];
    }
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    NSInteger num = [textField.text integerValue];
    if (num < 500) {
        textField.text = nil;
        NSLog(@"不低于500聊币");
        return;
    }
    
}

#pragma mark - Other

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

- (void)hiddenBadNumPickView {
    
    if (!_badNumPickView) return;
    [UIView animateWithDuration:0.2 animations:^{
        CGRect frame = _badNumPickView.frame;
        frame.size.height = 0.0;
        _badNumPickView.frame = frame;
    } completion:^(BOOL finished) {
        if (finished) {
            _badNumBtn.selected = NO;
            [_badNumPickView removeFromSuperview];
            _badNumPickView = nil;
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
