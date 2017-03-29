//
//  PoliceOrWitchView.h
//  WolfKill
//
//  Created by Zhuge_Su on 2017/3/29.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSUPoliceOrWitchView : UIView

@property (nonatomic , assign) BOOL IsPoliceOrWitch;

- (instancetype)initWithFrame:(CGRect)frame isPolice:(BOOL)isPolice;

@end
