//
//  CampView.h
//  WolfKill
//
//  Created by 清正 on 2017/3/28.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 狼人(最多5人)或好人(最多10人)阵营
typedef NS_ENUM(NSInteger, CampViewType) {
    CampViewTypeWerewolf,
    CampViewTypeGoodPerson,
    CampViewTypeLover,
};

@interface CampView : UIView

/// 背景图片
@property (weak, nonatomic) IBOutlet UIButton *bgImageView;
/// 胜利/失败图片
@property (weak, nonatomic) IBOutlet UIImageView *typeImageView;
/// 人按钮背景
@property (weak, nonatomic) IBOutlet UIView *btnBgView;
/// btn数组
@property (strong, nonatomic) NSMutableArray *buttonArray;


- (instancetype)initWithFrame:(CGRect)frame type:(CampViewType)type;

@end
