//
//  UIView+Extensions.m
//  ZPM
//
//  Created by 陈宇 on 15/3/20.
//  Copyright (c) 2015年 陈宇. All rights reserved.
//

#import "UIView+Convenience.h"

@implementation UIView (Convenience)

#pragma mark - 属性set方法
- (void)setX:(CGFloat)x {
    CGRect frame      = self.frame;
    frame.origin.x    = x;
    self.frame        = frame;
}

- (void)setY:(CGFloat)y {
    CGRect frame      = self.frame;
    frame.origin.y    = y;
    self.frame        = frame;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame      = self.frame;
    frame.origin      = origin;
    self.frame        = frame;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame      = self.frame;
    frame.size.width  = width;
    self.frame        = frame;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame      = self.frame;
    frame.size.height = height;
    self.frame        = frame;
}

- (void)setSize:(CGSize)size {
    CGRect frame      = self.frame;
    frame.size        = size;
    self.frame        = frame;
}

- (void)setCenterX:(CGFloat)centerX {
    CGPoint center    = self.center;
    center.x          = centerX;
    self.center       = center;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint center    = self.center;
    center.y          = centerY;
    self.center       = center;
}

#pragma mark - 属性get方法
- (CGFloat)x {
    return self.frame.origin.x;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (CGSize)size {
    return self.frame.size;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (CGFloat)centerY {
    return self.center.y;
}

-(void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.clipsToBounds = cornerRadius > 0;
}
-(CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}


- (void)cornerRectWith:(UIRectCorner)rectCorner cornerRadii:(CGSize)radii {
    UIBezierPath *maskPath  = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorner cornerRadii:radii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame         = self.bounds;
    maskLayer.path          = maskPath.CGPath;
    self.layer.mask         = maskLayer;
}

- (void)shakeWithCount:(int)count interval:(NSTimeInterval)interval {
    NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:
                          [NSNumber numberWithDouble:interval], @"interval",
                          [NSNumber numberWithInt:count],@"count",
                          [NSValue valueWithCGPoint:self.center],@"center",
                          nil];
    [NSTimer scheduledTimerWithTimeInterval:interval
                                     target:self
                                   selector:@selector(shaking:)
                                   userInfo:info repeats:NO];
}

- (void)shaking:(NSTimer *)aTimer {
    NSMutableDictionary *info = [NSMutableDictionary dictionaryWithDictionary:[aTimer userInfo]];
    [aTimer invalidate];
    aTimer = nil;
    int shakeCnt = [[info objectForKey:@"count"] intValue];
    CGPoint orgCenter = [[info objectForKey:@"center"] CGPointValue];
    CGPoint to;
    if (shakeCnt % 2 == 0 && shakeCnt > 0) {
        to = CGPointMake(orgCenter.x + floor(random() % shakeCnt) - shakeCnt / 2,
                         orgCenter.y + floor(random() % shakeCnt) - shakeCnt / 2);
    } else {
        to = orgCenter;
    }
    
    [self setCenter:to];
    shakeCnt--;
    if (shakeCnt > 0) {
        [info setObject:[NSNumber numberWithInt:shakeCnt] forKey:@"count"];
        [NSTimer scheduledTimerWithTimeInterval:[[info objectForKey:@"interval"] doubleValue]
                                         target:self
                                       selector:@selector(shaking:)
                                       userInfo:info repeats:NO];
    }
}

- (UIImage *)snapshoot {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.layer.contentsScale);//[UIScreen mainScreen].scale
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snapshootImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snapshootImage;
}

- (UIViewController *)viewController {
    // 下一个响应者
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]] ) {
            return (UIViewController *)next;
        }
        
        next = [next nextResponder];
    } while (next != nil);
    
    return nil;
}

/**
 *  获取当前视图控制器
 *
 *  @return 视图控制器
 */
+ (UIViewController *)currentShowTopVC {
    UIViewController *top = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (top.presentedViewController) {
        top = top.presentedViewController;
    }
    if ([top isKindOfClass:[UINavigationController class]]) {
        UINavigationController *vc = (UINavigationController *)top;
        return vc.topViewController;
    } else {
        return top;
    }
}

@end
