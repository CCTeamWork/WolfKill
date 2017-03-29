//
//  MSUAlertDetailView.m
//  WolfKill
//
//  Created by Zhuge_Su on 2017/3/28.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import "MSUAlertDetailView.h"
#import "MSUHeader.h"

@implementation MSUAlertDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self createView];
        
    }
    return self;
}


- (void)createView{
    //背景视图
    CGFloat navWid = WIDTH -80;
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, navWid, 100)];
    [self addSubview:navView];
    navView.backgroundColor = MIMABGCOLOR;
    
    //密码图片
    UIImageView *nimaIma = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, navWid, 80)];
    nimaIma.image = [UIImage imageNamed:@"shifoushezhimima"];
    [navView addSubview:nimaIma];
    
    //勾选按钮
    self.gouBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_gouBtn setImage:[UIImage imageNamed:@"mima_bor"] forState:UIControlStateNormal];
    _gouBtn.adjustsImageWhenHighlighted = NO;
    [self addSubview:_gouBtn];
    [_gouBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(navView.top).offset(5);
        make.right.equalTo(navView.right).offset(-rightSpace);
        make.width.equalTo(rightSpace*2);
        make.height.equalTo(rightSpace*2);
    }];
    
    
    //取消和确定按钮
    NSArray *btnArr = @[@"quexiao_yellow",@"queding_yellow"];
    for (int i = 0; i < 2; i++) {
        self.sureOrCancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureOrCancelBtn setImage:[UIImage imageNamed:btnArr[i]] forState:UIControlStateNormal];
        _sureOrCancelBtn.adjustsImageWhenHighlighted = NO;
        [navView addSubview:self.sureOrCancelBtn];
        [_sureOrCancelBtn makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(navView.bottom).offset(25);
            make.left.equalTo(navView.left).offset(leftSpace + ((navWid - 60) * 0.5 + leftSpace) * i);
            make.width.equalTo((navWid - 60) * 0.5);
            make.height.equalTo(40);
        }];
    }
    
    //输入框
    CGFloat tfWidth = navWid - leftSpace * 4;
    self.mimaTF = [[UITextField alloc] init];
    [navView addSubview:_mimaTF];
    _mimaTF.backgroundColor = [UIColor clearColor];
    _mimaTF.keyboardType = UIKeyboardTypeNumberPad;
    _mimaTF.tintColor = [UIColor clearColor];
    _mimaTF.textColor =[UIColor clearColor];
    [_mimaTF makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_sureOrCancelBtn.top).offset(-10);
        make.left.equalTo(navView.left).offset(leftSpace * 2);
        make.width.equalTo(tfWidth);
        make.height.equalTo(30);
    }];
    _mimaTF.delegate =self;

    //设置密码按钮
    for (int i = 0; i < 4; i++) {
        self.pwdSetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_pwdSetBtn setBackgroundImage:[UIImage imageNamed:@"mima"] forState:UIControlStateNormal];
        _pwdSetBtn.userInteractionEnabled = NO;
        [_pwdSetBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        _pwdSetBtn.tag = 40 + i;
        [navView addSubview:_pwdSetBtn];
        [_pwdSetBtn makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_mimaTF.top).offset(0);
            make.left.equalTo(_mimaTF.left).offset(20 + (30 + (tfWidth - 30*4 - 40)/3)*i);
            make.width.equalTo(30);
            make.height.equalTo(30);
        }];
        
        if (!_pwdMuArr) {
            _pwdMuArr = [NSMutableArray array];
        }
        [_pwdMuArr addObject:_pwdSetBtn];

    }

}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"=====%lu",(unsigned long)string.length);
    NSLog(@"-----%lu",textField.text.length);
    NSLog(@"~~~~~%lu",range.length);
    if (string.length > 1) {
        return NO;
    }
    if (textField.text.length>=4) {
        if (string.length==0) {
            UIButton *button =_pwdMuArr[range.location];
            [button setTitle:@"" forState:UIControlStateNormal];
            return YES;
        } return NO;
    } else {
        if (range.length==1) {
            UIButton *button =_pwdMuArr[range.location];
            [button setTitle:@"" forState:UIControlStateNormal];
        } else {
            UIButton *button =_pwdMuArr[range.location];
            [button setTitle:string forState:UIControlStateNormal];
        }
        return YES;
    }
}

@end
