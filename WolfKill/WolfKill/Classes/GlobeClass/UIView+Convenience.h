//
//  UIView+Extensions.h
//  ZPM
//
//  Created by 陈宇 on 15/3/20.
//  Copyright (c) 2015年 陈宇. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  UIView的坐标获取
 */
@interface UIView (Convenience)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize  size;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
/**
 *  给UIView的Xib添加一个切边的属性
 */
@property(nonatomic,assign) IBInspectable CGFloat cornerRadius;


/**
 *  改变UIView制定几个角圆角
 *
 *  @param rectCorner 选择哪个角(可填多种,用"|"隔开)
 *  @param radii      定制的大小
 */
- (void)cornerRectWith:(UIRectCorner)rectCorner cornerRadii:(CGSize)radii;
/**
 *  让当前view抖动
 *
 *  @param count     抖动次数/范围
 *  @param interval 每次抖动的时间
 */
- (void)shakeWithCount:(int)count interval:(NSTimeInterval)interval;

/**
 *  获得当前视图的快照
 *
 *  @return 当前视图快照图片
 */
- (UIImage *)snapshoot;

/**
 *  获取当前视图的响应者
 *
 *  @return 当前视图的控制器
 */
- (UIViewController *)viewController;

/**
 *  获取最上层的视图控制器
 *
 *  @return 视图控制器
 */
+ (UIViewController *)currentShowTopVC;

@end
