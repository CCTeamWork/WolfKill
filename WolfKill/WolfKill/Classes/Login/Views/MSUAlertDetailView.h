//
//  MSUAlertDetailView.h
//  WolfKill
//
//  Created by Zhuge_Su on 2017/3/28.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSUAlertDetailView : UIView <UITextFieldDelegate>
@property (nonatomic , strong) UIButton *gouBtn;
@property (nonatomic , strong) UIButton *sureOrCancelBtn;
@property (nonatomic , strong) UITextField *mimaTF;
@property (nonatomic , strong) NSMutableArray *pwdMuArr;
@property (nonatomic , strong) UIButton *pwdSetBtn;
@end
