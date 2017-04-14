//
//  LiveViewController.m
//  WolfKill
//
//  Created by 清正 on 2017/4/10.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import "LiveViewController.h"
#import <NIMAVChat/NIMAVChat.h>
#import <NIMSDK/NIMSDK.h>
#import "LoginOrRegist.h"

@interface LiveViewController ()

@property (nonatomic, copy)NSString *number;
@property (nonatomic, copy)NSString *name;

@end

@implementation LiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _number =@"20170410";
    _name =@"sqz2017";
    
    [[LoginOrRegist shareUserInfo] regist:_name result:^(NSString *message, NSInteger code) {
        [[LoginOrRegist shareUserInfo]login:_name result:^(NSString *message, NSInteger code) {
            if (code==200) {
                [self reserveMeetingWithRoomId:_number];
            }
        }];
    }];
}

/*
 **预约会议
 */
- (void)reserveMeetingWithRoomId:(NSString *)roomId {
    NIMNetCallMeeting *meeting = [[NIMNetCallMeeting alloc] init];
    meeting.name = roomId;
    meeting.type = NIMNetCallMediaTypeVideo;
    meeting.ext = @"扩展信息";
    meeting.actor = NO;
    [[NIMAVChatSDK sharedSDK].netCallManager reserveMeeting:meeting completion:^(NIMNetCallMeeting * _Nonnull meeting, NSError * _Nonnull error) {
        if (!error) {
            NSLog(@"预定成功 ，进入房间");
            [self joinNetCallWithRMeeting:meeting];
        } else {
            if (error.code == 417) {
                [self joinNetCallWithRMeeting:meeting];
            } else {
                NSLog(@"预定房间失败");
            }
        }
    }];
}

/*
 **加入会议
 */
- (void)joinNetCallWithRMeeting:(NIMNetCallMeeting *)rMeeting {
    NIMNetCallOption *callOption =[[NIMNetCallOption alloc]init];
    // 自动旋转远端画面
    callOption.autoRotateRemoteVideo =YES;
    // 是否使用后置摄像头
    callOption.startWithBackCamera =NO;
    // 加入会议的类型->音频/视频
    rMeeting.type =NIMNetCallMediaTypeVideo;
    // 是否发送音视频数据
    rMeeting.actor = NO;
    // 网路电话配置
    rMeeting.option = callOption;
    //进入房间聊天
    [[NIMAVChatSDK sharedSDK].netCallManager joinMeeting:rMeeting completion:^(NIMNetCallMeeting * _Nonnull meeting, NSError * _Nonnull error) {
        if (!error) {
            NSLog(@"进入成功");
        } else {
            NSLog(@"进入失败");
            [self reserveMeetingWithRoomId:_number];
        }
    }];
}

/*
 **离开会议
 */
- (void)MSUNetCallManagerLeaveMeeting {
    NIMNetCallMeeting *meeting = [[NIMNetCallMeeting alloc] init];
    meeting.name = _number;
    [[NIMAVChatSDK sharedSDK].netCallManager leaveMeeting:meeting];
}

/*
 **开启音视频
 */
- (void)MSUOpenVideoAndAudio {
    [[NIMAVChatSDK sharedSDK].netCallManager setMeetingRole:YES];
    [[NIMAVChatSDK sharedSDK].netCallManager setCameraDisable:NO];
    [[NIMAVChatSDK sharedSDK].netCallManager setMute:NO];
}

/*
 *关闭音视频
 */
- (void)MSUCloseVideoAndAudio {
    [[NIMAVChatSDK sharedSDK].netCallManager setMeetingRole:NO];
    [[NIMAVChatSDK sharedSDK].netCallManager setCameraDisable:YES];
    [[NIMAVChatSDK sharedSDK].netCallManager setMute:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
