//
//  FriendsCell.m
//  WolfKill
//
//  Created by 清正 on 2017/3/29.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import "FriendsCell.h"
#import "UIView+Convenience.h"

@implementation FriendsCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

+ (FriendsCell*)findCellWithIdentifier:(NSString*)identifier {
    NSArray *cellArray =[[NSBundle mainBundle] loadNibNamed:@"FriendsCell" owner:nil options:nil];
    for (FriendsCell *cell in cellArray) {
        if ([cell.reuseIdentifier isEqualToString:identifier]) {
            return cell;
        }
    }
    return nil;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
