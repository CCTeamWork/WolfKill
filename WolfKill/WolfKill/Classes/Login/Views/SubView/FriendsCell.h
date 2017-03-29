//
//  FriendsCell.h
//  WolfKill
//
//  Created by 清正 on 2017/3/29.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *selectButton;

+ (FriendsCell*)findCellWithIdentifier:(NSString*)identifier;

@end
