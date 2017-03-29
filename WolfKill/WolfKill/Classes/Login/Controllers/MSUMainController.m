//
//  MSUMainController.m
//  WolfKill
//
//  Created by Zhuge_Su on 2017/3/28.
//  Copyri/System/Library/CoreServices/Finder.app/Contents/Resources/MyLibraries/myDocuments.cannedSearchght © 2017年 Zhuge_Su. All rights reserved.
//

#import "MSUMainController.h"
#import "MSUHeader.h"
#import "MSUNavgitionView.h"
#import "MSUCharactorView.h"

#import "AlertBgView.h"
#import "MainCenterView.h"
#import "CampView.h"

@interface MSUMainController ()

//两边人物视图
@property (nonatomic, strong) MSUCharactorView *characView;
//中间所有的视图
@property (nonatomic, strong) MainCenterView *centerView;

@end

@implementation MSUMainController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = BGCOLOR;
    
    [self createNavi];
    [self createCharactorRoom];
    // 中间视图
    self.centerView =[[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([MainCenterView class]) owner:nil options:nil]firstObject];
    _centerView.backgroundColor =[UIColor clearColor];
    [self.view addSubview:_centerView];
    [_centerView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(64+15);
        make.left.equalTo(_characView.leftCharactBtn.right).offset(10);
        make.right.equalTo(_characView.rightCharactBtn.left).offset(-10);
        make.bottom.equalTo(_characView.bottomCharactBtn.top).offset(10);
    }];
}

//导航栏
- (void)createNavi{
    MSUNavgitionView *nav = [[MSUNavgitionView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 64)];
    [self.view addSubview:nav];
    [nav.backBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [nav.renBtn addTarget:self action:@selector(renBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClick:(UIButton *)sender {
    AlertBgView *alert =[[AlertBgView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    alert.clickRemove =YES;
    alert.bgColor =[UIColor colorWithWhite:0 alpha:0.5];
    [alert showView];
        
    _centerView.topText =@"宋清正\n测试文字\n(0s)";
    _centerView.centerText =@"是否使用毒药,是都使用毒药?";

}

- (void)renBtnClick:(UIButton *)sender{
    _centerView.topText =@"sqz宋清正sqz\n测试文字\n(15s)";
    _centerView.centerText =@"不使用";
}

- (void)keywordsButtonClick:(UIButton*)button {
    AlertBgView *alert =[[AlertBgView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    alert.clickRemove =YES;
    alert.bgColor =[UIColor colorWithWhite:0 alpha:0.3];
    [alert showView];
    
    alert.centerView_height.constant =0;
//    CGFloat sup_width =CGRectGetWidth(alert.topView.frame);
//    CGFloat sup_height =CGRectGetHeight(alert.topView.frame);
    
    CampView *oneView =[[CampView alloc]initWithFrame:CGRectZero type:CampViewTypeWerewolf];
    [alert.topView addSubview:oneView];
    [oneView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(alert.topView.bottom).offset(-150);
        make.left.equalTo(alert.topView.left).offset(10);
        make.right.equalTo(alert.topView.right).offset(-10);
        make.height.equalTo(150);
    }];
    
    UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectZero];
    imageView.contentMode =UIViewContentModeScaleAspectFit;
    imageView.image =[UIImage imageNamed:@"duizhantongji"];
    [alert.topView addSubview:imageView];
    [imageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oneView.bgImageView.top).offset(-25);
        make.left.equalTo(oneView.left).offset(10);
        make.right.equalTo(oneView.right).offset(-10);
        make.height.equalTo(35);
    }];
    
    CampView *twoView =[[CampView alloc]initWithFrame:CGRectZero type:CampViewTypeGoodPerson];
    [alert.btmView addSubview:twoView];
    
    [twoView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(alert.btmView.top);
        make.left.equalTo(alert.btmView.left).offset(10);
        make.right.equalTo(alert.btmView.right).offset(-10);
        make.height.equalTo(150);
    }];
}

//人物形象
- (void)createCharactorRoom {
    self.characView = [[MSUCharactorView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT - 64)];
    [self.view addSubview:_characView];
    [_characView.wordBtn addTarget:self action:@selector(keywordsButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_characView.videoBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_characView.passBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}


@end
