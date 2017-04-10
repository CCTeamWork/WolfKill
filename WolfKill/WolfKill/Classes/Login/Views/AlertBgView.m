//
//  AlertBgView.m
//  WolfKill
//
//  Created by 清正 on 2017/3/28.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import "AlertBgView.h"

@interface AlertBgView () <UIGestureRecognizerDelegate>

@end

@implementation AlertBgView

- (instancetype)initWithFrame:(CGRect)frame {
    self =[super initWithFrame:frame];
    if (self) {
        self =[[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
        
        self.topView.backgroundColor =[UIColor clearColor];
        self.btmView.backgroundColor =[UIColor clearColor];
        self.centerView.backgroundColor =[UIColor clearColor];

        self.frame =CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
        UITapGestureRecognizer *top =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didBgView:)];
        top.delegate =self;
        [self addGestureRecognizer:top];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setBgColor:(UIColor *)bgColor {
    _bgColor =bgColor;
    self.backgroundColor =bgColor;
}

- (void)didBgView:(UITapGestureRecognizer *)sender {
    if (self.clickRemove) {
        [sender.view removeFromSuperview];
    }
}

- (void)showView {
    UIWindow *windiw =[[UIApplication sharedApplication]keyWindow];
    if (!windiw) {
        windiw =[[[UIApplication sharedApplication]windows] lastObject];
    }
    NSInteger count =windiw.subviews.count;
    [windiw insertSubview:self atIndex:count];
}

- (void)removeView {
    [self removeFromSuperview];
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    // 点击tableViewCell不执行Touch事件
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"] ||
        touch.view.tag ==2020) {
        return NO;
    }
    return  YES;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
