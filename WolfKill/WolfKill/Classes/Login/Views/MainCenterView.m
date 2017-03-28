//
//  MainCenterView.m
//  WolfKill
//
//  Created by 清正 on 2017/3/28.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import "MainCenterView.h" 

@interface MainCenterView ()

@property (weak, nonatomic) IBOutlet UILabel *topLabel;

@end

@implementation MainCenterView

- (void)awakeFromNib {
    [super awakeFromNib];

//    _topLabel.font =[UIFont fontWithName:@"FashionFont052,by-www.6763.net" size:18];
}

- (void)setTopText:(NSString *)topText {
    _topText =topText;
    if (_topText.length ==0) {
        _topLabel.superview.hidden =YES;
        _topLabel.text =@"";
    } else {
        _topLabel.superview.hidden =NO;
        _topLabel.text =_topText;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
