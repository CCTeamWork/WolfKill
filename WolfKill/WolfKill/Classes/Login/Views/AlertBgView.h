//
//  AlertBgView.h
//  WolfKill
//
//  Created by 清正 on 2017/3/28.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertBgView : UIView
// 顶部视图
@property (weak, nonatomic) IBOutlet UIView *topView;
// 中部视图高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerView_height;
// 中部视图
@property (weak, nonatomic) IBOutlet UIView *centerView;
// 底部视图
@property (weak, nonatomic) IBOutlet UIView *btmView;
// 设置背景颜色
@property (nonatomic, strong) UIColor *bgColor;
// 点击背景是否移除
@property (nonatomic, assign) BOOL clickRemove;

- (void)showView;

- (void)removeView;

@end
