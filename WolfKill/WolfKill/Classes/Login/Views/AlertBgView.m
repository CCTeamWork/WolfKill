//
//  AlertBgView.m
//  WolfKill
//
//  Created by 清正 on 2017/3/28.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import "AlertBgView.h"

@interface AlertBgView ()

@end

@implementation AlertBgView

- (instancetype)initWithFrame:(CGRect)frame {
    self =[super initWithFrame:frame];
    if (self) {
        self =[[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
        
        self.topView.backgroundColor =[UIColor clearColor];
        self.btmView.backgroundColor =[UIColor clearColor];

        self.frame =CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didBgView:)]];
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
    [[[UIApplication sharedApplication]keyWindow] addSubview:self];
}

- (void)removeView {
    [self removeFromSuperview];
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
